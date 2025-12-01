import Foundation

public struct SimInsn {
    public let ic: Int
    public let mnemonic: String
    public let args: [Int]

    public init(ic: Int, mnemonic: String, args: [Int] = []) {
        self.ic = ic
        self.mnemonic = mnemonic
        self.args = args
    }
}

/// Simulate a Procedure with a procMap allowing calls to other procedures.
/// - Parameters:
///   - currSeg: segment info (unused currently, kept for future mapping)
///   - proc: the Procedure to simulate
///   - procMap: dictionary keyed by (segment<<16)|procNumber -> Procedure for resolving calls
/// - Returns: ExecutionResult from the top-level call
public func simulateProcedure(currSeg: Segment, proc: Procedure, procMap: [Int: Procedure]) throws -> ExecutionResult {
    let machine = Machine()
    // Build instruction maps for procedures as SimInsn arrays
    func insns(for p: Procedure) -> [SimInsn] { simInsns(from: p) }

    // Call stack of (insns, pc)
    var callStack: [(ins: [SimInsn], pc: Int)] = []
    var currentIns = insns(for: proc)
    var currentPC = proc.enterIC

    while true {
        // Build map for quick lookup
        let insMap: [Int: SimInsn] = Dictionary(uniqueKeysWithValues: currentIns.map { ($0.ic, $0) })
        // Compute the default next IC (the next instruction's IC) so stepping uses correct PC increments
        let sortedICs = currentIns.map { $0.ic }.sorted()
        guard let ins = insMap[currentPC] else { break }
        let defaultNextPC: Int? = {
            if let idx = sortedICs.firstIndex(of: currentPC), idx + 1 < sortedICs.count {
                return sortedICs[idx + 1]
            }
            return nil
        }()

        let (nextPC, callProc, returned) = try machine.executeStep(ins: ins, currentPC: currentPC, defaultNextPC: defaultNextPC)
        if let callProc = callProc {
            // resolve callee
            let key = (proc.procType?.segment ?? 0) << 16 | callProc
            if let callee = procMap[key] {
                // push current context
                callStack.append((currentIns, nextPC))
                // switch to callee
                currentIns = insns(for: callee)
                currentPC = callee.enterIC
                continue
            } else {
                // unknown callee: treat as external and continue
                currentPC = nextPC
                continue
            }
        }
        if returned {
            // pop return address from machine stack
            if let ret = machine.popReturnIP() {
                // pop frame handled in executeStep? ensure frame popped
                _ = machine.popFrame()
                if let ctx = callStack.popLast() {
                    currentIns = ctx.ins
                    currentPC = ret
                    continue
                } else {
                    // top-level return
                    break
                }
            } else {
                break
            }
        }
        currentPC = nextPC
    }

    // Filter out any lingering return-IP values (which are instruction ICs)
    // so that caller data values are preserved in the returned stack.
    var allICs = Set<Int>()
    // include ICs from the top-level proc (currentIns) and any procs in procMap
    for ins in currentIns { allICs.insert(ins.ic) }
    for (_, p) in procMap {
        let s = simInsns(from: p)
        for i in s { allICs.insert(i.ic) }
    }
    let filteredStack = machine.stack.filter { !allICs.contains($0) }

    return ExecutionResult(stack: filteredStack, trace: machine.currentTrace(), memory: machine.currentMemory(), halted: true)
}

public struct ExecutionResult {
    public let stack: [Int]
    public let trace: [(Int, String)]
    public let memory: [Int: Int]
    public let halted: Bool
}

public enum SimulatorError: Error, CustomStringConvertible {
    case stackUnderflow
    case unknownOpcode(String)
    case maxStepsExceeded(Int)

    public var description: String {
        switch self {
        case .stackUnderflow: return "stack underflow"
        case .unknownOpcode(let op): return "unknown opcode: \(op)"
        case .maxStepsExceeded(let n): return "max steps exceeded: \(n)"
        }
    }
}

public final class Machine {
    public private(set) var stack: [Int] = []
    private var memory: [Int: Int] = [:]      // simple flat memory by integer address
    private var pc: Int = 0
    private var trace: [(Int, String)] = []
    // Frame stack: each frame has an id and a base address used when resolving lex addresses
    private struct Frame {
        let id: Int
        let base: Int
    }
    private var frames: [Frame] = []
    private var nextFrameID: Int = 1

    public init() {}

    public func reset() {
        stack = []
        memory = [:]
        pc = 0
        trace = []
        frames = []
        nextFrameID = 1
    }

    // Resolve encoded address to canonical flat memory key. New encoding uses
    // [segment:8][procOrLex:8][addr:16]. If procOrLex has high bit set, treat
    // it as lexical-level addressing and resolve against the current top frame base.
    private func flatKey(forEncoded encoded: Int) -> Int {
        // Interpret as three-field encoding [segment:8][procOrLex:8][addr:16]
        if encoded & 0xffff0000 != 0 {
            let seg8 = (encoded >> 24) & 0xff
            let p8 = (encoded >> 16) & 0xff
            let a = encoded & 0xffff
            let isLex = (p8 & 0x80) != 0
            let pVal = p8 & 0x7f

            if isLex {
                // Resolve lexical address relative to the current frame base (MP)
                if let top = frames.last {
                    let base = top.base
                    let resolved = base + a
                    return (seg8 << 24) | (resolved & 0xffff)
                } else {
                    // No frame: fall back to proc-relative encoding
                    return (seg8 << 24) | (pVal << 16) | a
                }
            } else {
                return (seg8 << 24) | (pVal << 16) | a
            }
        }

        // Plain integer address
        return encoded
    }

    // Frame management
    // MP register: points at the current frame base (or nil if none)
    private(set) public var MP: Int? = nil

    /// Enter a new frame. If base == 0, a default base is allocated automatically.
    public func enterFrame(base: Int) -> Int {
        let id = nextFrameID
        nextFrameID += 1
        var useBase = base
        if useBase == 0 {
            // Allocate a default frame base in a deterministic region
            useBase = id * 0x1000
        }
        frames.append(Frame(id: id, base: useBase))
        MP = useBase
        return id
    }

    @discardableResult
    public func popFrame() -> Int? {
        guard let f = frames.popLast() else { return nil }
        // restore MP to previous frame base or nil
        if let prev = frames.last {
            MP = prev.base
        } else {
            MP = nil
        }
        return f.id
    }

    // Pop a return IP from the machine stack (used by simulateProcedure)
    public func popReturnIP() -> Int? {
        return stack.popLast()
    }

    // Expose trace and memory for external consumers
    public func currentTrace() -> [(Int, String)] { return trace }
    public func currentMemory() -> [Int: Int] { return memory }

    /// Execute a list of instructions (SimInsn). Entry starts at entryIC.
    public func execute(instructions: [SimInsn], entryIC: Int = 0, maxSteps: Int = 10_000) throws -> ExecutionResult {
        reset()
        pc = entryIC
        let insMap: [Int: SimInsn] = Dictionary(uniqueKeysWithValues: instructions.map { ($0.ic, $0) })
        // Precompute the sorted instruction ICs so the "next" PC is the next instruction's IC
        let sortedICs = instructions.map { $0.ic }.sorted()

        var steps = 0
        var halted = false

        while steps < maxSteps {
            steps += 1
            guard let ins = insMap[pc] else {
                halted = true
                break
            }

            trace.append((pc, ins.mnemonic))
            // Default to the next instruction IC if present; otherwise halt
            var nextPC: Int
            if let idx = sortedICs.firstIndex(of: pc), idx + 1 < sortedICs.count {
                nextPC = sortedICs[idx + 1]
            } else {
                // no next instruction -> treat as halt
                halted = true
                break
            }

            switch ins.mnemonic.uppercased() {
            case "SLDC", "LDC", "LDCI", "LDCN":
                if let v = ins.args.first { stack.append(v) } else { stack.append(0) }
            case "LDA", "LLA":
                // Load an address (LDA/LLA) - push resolved flat key
                var aaddr = ins.args.first ?? 0
                aaddr = self.flatKey(forEncoded: aaddr)
                stack.append(aaddr)
            case "LDL":
                var lad = ins.args.first ?? 0; lad = self.flatKey(forEncoded: lad); stack.append(memory[lad] ?? 0)
            case "LDM":
                if let count = ins.args.first {
                    guard stack.count >= 1 else { throw SimulatorError.stackUnderflow }
                    let addr = stack.removeLast()
                    for i in 0..<count { stack.append(memory[addr + i] ?? 0) }
                }

            case "STM":
                // Store n words from source (TOS) to destination (TOS-1)
                if let count = ins.args.first { 
                    guard stack.count >= 2 else { 
                        throw SimulatorError.stackUnderflow 
                    }
                    let src = stack.removeLast()
                    let dst = stack.removeLast()
                    for i in 0..<count { 
                        memory[dst + i] = memory[src + i] ?? 0 
                    } 
                }

            case "ADJ":
                // Adjust / drop n words from the stack (used for set adjustment)
                if let n = ins.args.first {
                    guard n >= 0 else { break }
                    guard stack.count >= n else { throw SimulatorError.stackUnderflow }
                    for _ in 0..<n { _ = stack.removeLast() }
                }

            case "MOV":
                // Move n words from source (TOS) to destination (TOS-1)
                if let n = ins.args.first {
                    guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                    let src = stack.removeLast()
                    let dst = stack.removeLast()
                    for i in 0..<n { memory[dst + i] = memory[src + i] ?? 0 }
                }

            case "SAS":
                // String assign: copy n bytes from src (TOS) to dst (TOS-1)
                if let n = ins.args.first {
                    guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                    let src = stack.removeLast()
                    let dst = stack.removeLast()
                    for i in 0..<n { memory[dst + i] = memory[src + i] ?? 0 }
                }

            case "SRO", "STE":
                // Store global/extended word: args[0] is encoded address (inserted by simInsns)
                guard stack.count >= 1 else { throw SimulatorError.stackUnderflow }
                let val = stack.removeLast()
                var addrEnc = ins.args.first ?? 0
                addrEnc = self.flatKey(forEncoded: addrEnc)
                memory[addrEnc] = val
       
            case "ADI":
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                let b = stack.removeLast(); let a = stack.removeLast(); stack.append(a + b)

            case "ADR":
                // Add reals - emulate as integer add for now
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                let br = stack.removeLast(); let ar = stack.removeLast(); stack.append(ar + br)

            case "ABI", "ABR":
                // Absolute value (integer/real) - implement as integer abs
                guard stack.count >= 1 else { throw SimulatorError.stackUnderflow }
                let vabi = stack.removeLast(); stack.append(abs(vabi))

            case "MPR":
                // Multiply reals - emulate as integer multiply
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                let bm = stack.removeLast(); let am = stack.removeLast(); stack.append(am * bm)

            case "NGR":
                guard stack.count >= 1 else { throw SimulatorError.stackUnderflow }
                let vngr = stack.removeLast(); stack.append(-vngr)

            case "FLO", "FLT":
                // Floating conversions - noop in integer simulator
                break

            case "SQI", "SQR":
                guard stack.count >= 1 else { throw SimulatorError.stackUnderflow }
                let v = stack.removeLast(); stack.append(v * v)

            case "STO":
                // Store indirect: store TOS into address TOS-1
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                let sval = stack.removeLast(); let saddr = stack.removeLast(); memory[saddr] = sval

            case "UNI":
                // Set union - emulate as bitwise OR
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                let rb = stack.removeLast(); let ra = stack.removeLast(); stack.append(ra | rb)

            case "LDE":
                // Load extended word: args are [segment, offset]
                if ins.args.count >= 2 {
                    let seg = ins.args[0]; let off = ins.args[1]
                    let enc = (seg & 0xff) << 24 | (0 << 16) | (off & 0xffff)
                    stack.append(memory[enc] ?? 0)
                }

            case "CSP":
                // Call standard procedure - treat as external call: push return IP and jump to external
                let targetProc = ins.args.first ?? nextPC
                stack.append(nextPC)
                _ = enterFrame(base: 0)
                nextPC = targetProc

            case "IXS", "SRS", "SGS":
                // String/set related ops - best-effort emulation: no-op or simple transform
                // IXS: index string array - no-op
                // SRS: subrange set - no-op
                // SGS: singleton set - leave TOS as-is
                break

            case "MODI":
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                let bmod = stack.removeLast(); let amod = stack.removeLast()
                stack.append(bmod == 0 ? 0 : (amod % bmod))

            case "SBI":
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                let b = stack.removeLast(); let a = stack.removeLast(); stack.append(a - b)

            case "MPI":
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                let b = stack.removeLast(); let a = stack.removeLast(); stack.append(a * b)
            
            case "NGI":
                guard stack.count >= 1 else { throw SimulatorError.stackUnderflow }
                let vngi = stack.removeLast(); stack.append(-vngi)
            
            case "DVI":
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                let b = stack.removeLast(); let a = stack.removeLast(); stack.append(b == 0 ? 0 : (a / b))

            case let op where op.hasPrefix("LEQ"):
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                let b = stack.removeLast(); let a = stack.removeLast(); stack.append(a <= b ? 1 : 0)

            case let op where op.hasPrefix("LES"):
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                let b = stack.removeLast(); let a = stack.removeLast(); stack.append(a < b ? 1 : 0)

            case let op where op.hasPrefix("GEQ"):
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                let b = stack.removeLast(); let a = stack.removeLast(); stack.append(a >= b ? 1 : 0)

            case let op where op.hasPrefix("GRT"):
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                let b = stack.removeLast(); let a = stack.removeLast(); stack.append(a > b ? 1 : 0)

            case "LAND":
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                let rb = stack.removeLast(); let ra = stack.removeLast(); stack.append((ra != 0 && rb != 0) ? 1 : 0)

            case "LOR":
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                let rb2 = stack.removeLast(); let ra2 = stack.removeLast(); stack.append((ra2 != 0 || rb2 != 0) ? 1 : 0)

            case "LNOT":
                guard stack.count >= 1 else { throw SimulatorError.stackUnderflow }
                let rv = stack.removeLast(); stack.append(rv == 0 ? 1 : 0)

            case "INC":
                // INC <n> : increment TOS by n (params[0]) or by immediate arg in ins.args
                if let n = ins.args.first {
                    guard stack.count >= 1 else { throw SimulatorError.stackUnderflow }
                    let top = stack.removeLast()
                    stack.append(top + n)
                } else {
                    // no operand: noop
                }

            case "LOD", "LDO":
                var addr = ins.args.first ?? 0
                addr = self.flatKey(forEncoded: addr)
                stack.append(memory[addr] ?? 0)

            case "LAO":
                // Load address (LAO): push the resolved flat memory key for the encoded address
                var laoAddr = ins.args.first ?? 0
                laoAddr = self.flatKey(forEncoded: laoAddr)
                stack.append(laoAddr)



            case "STL", "STR":
                guard stack.count >= 1 else { throw SimulatorError.stackUnderflow }
                let value = stack.removeLast()
                var addr = ins.args.first ?? 0
                addr = self.flatKey(forEncoded: addr)
                memory[addr] = value

            case "LDB":
                var addr = ins.args.first ?? 0
                addr = self.flatKey(forEncoded: addr)
                stack.append(memory[addr] ?? 0)
            case "LDP":
                // Load packed field (approx): pop address and push word at that address
                if stack.count >= 1 {
                    let addr = stack.removeLast()
                    stack.append(memory[addr] ?? 0)
                } else { throw SimulatorError.stackUnderflow }
            case "STB":
                guard stack.count >= 1 else { throw SimulatorError.stackUnderflow }
                let v = stack.removeLast()
                var addr = ins.args.first ?? 0
                addr = self.flatKey(forEncoded: addr)
                memory[addr] = v & 0xFF

            case "IND":
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                let offset = stack.removeLast(); let base = stack.removeLast(); let effective = base + offset; stack.append(memory[effective] ?? 0)



            case "SIND":
                guard stack.count >= 3 else { throw SimulatorError.stackUnderflow }
                let value = stack.removeLast(); let offset = stack.removeLast(); let base = stack.removeLast(); let effective = base + offset; memory[effective] = value

            case "UJP":
                nextPC = ins.args.first ?? nextPC

            case "FJP":
                guard stack.count >= 1 else { throw SimulatorError.stackUnderflow }
                let cond = stack.removeLast(); if cond == 0 { nextPC = ins.args.first ?? nextPC }

            case "CIP":
                let target = ins.args.first ?? nextPC; stack.append(nextPC); nextPC = target

            case "RNP", "RBP":
                halted = true; break

            case let op where op.hasPrefix("EQL"):
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                let b = stack.removeLast(); let a = stack.removeLast(); stack.append(a == b ? 1 : 0)

            case let op where op.hasPrefix("NEQ"):
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                let b = stack.removeLast(); let a = stack.removeLast(); stack.append(a != b ? 1 : 0)

            default:
                throw SimulatorError.unknownOpcode(ins.mnemonic)
            }

            if halted { break }
            pc = nextPC
        }

        if steps >= maxSteps { throw SimulatorError.maxStepsExceeded(maxSteps) }

        return ExecutionResult(stack: stack, trace: trace, memory: memory, halted: halted)
    }

    /// Execute a single instruction step. Returns (nextPC, callProcNumber?, didReturn)
    /// - If a call is encountered (CIP/CBP/CLP/CXP/CGP) the function will push the return IP
    ///   and allocate a frame, then return the callee proc number so the caller can dispatch.
    public func executeStep(ins: SimInsn, currentPC: Int, defaultNextPC: Int? = nil) throws -> (nextPC: Int, callProc: Int?, returned: Bool) {
        // Use provided defaultNextPC (typically the next instruction's IC). Fall back to currentPC+1.
        var nextPC = defaultNextPC ?? (currentPC + 1)
        let op = ins.mnemonic.uppercased()
        switch op {
        case "CIP", "CBP", "CLP", "CXP", "CGP":
            // proc number expected in args[0]
            let procNum = ins.args.first ?? 0
            stack.append(nextPC) // push return ip (the next instruction IC)
            _ = enterFrame(base: 0)
            return (nextPC, procNum, false)
        case "RNP", "RBP":
            // signal return to caller; caller will pop return IP
            return (nextPC, nil, true)
        default:
            // delegate to the full execute path by temporarily executing this single ins
            // We'll reuse existing handlers by building a one-element map and stepping through
            // Simpler: replicate the per-op logic for common ops used in tests.
            // Implement a subset by reusing existing execute logic paths where possible.
            // For maintainability, call into the big switch by constructing a temporary insMap.
            // We'll perform the local logic inline for the same ops implemented in execute().
            switch op {
            case "SLDC", "LDC", "LDCI", "LDCN":
                if let v = ins.args.first { stack.append(v) } else { stack.append(0) }
            case "ADI":
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                let b = stack.removeLast(); let a = stack.removeLast(); stack.append(a + b)
            case "MODI":
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                let bmod = stack.removeLast(); let amod = stack.removeLast(); stack.append(bmod == 0 ? 0 : (amod % bmod))
            case "SBI":
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                let b = stack.removeLast(); let a = stack.removeLast(); stack.append(a - b)
            case "MPI":
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                let b = stack.removeLast(); let a = stack.removeLast(); stack.append(a * b)
            case "NGI":
                guard stack.count >= 1 else { throw SimulatorError.stackUnderflow }
                let vngi = stack.removeLast(); stack.append(-vngi)
            case "DVI":
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                let b = stack.removeLast(); let a = stack.removeLast(); stack.append(b == 0 ? 0 : (a / b))
            case let op where op.hasPrefix("LEQ"):
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                let b = stack.removeLast(); let a = stack.removeLast(); stack.append(a <= b ? 1 : 0)
            case let op where op.hasPrefix("LES"):
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                let b = stack.removeLast(); let a = stack.removeLast(); stack.append(a < b ? 1 : 0)
            case let op where op.hasPrefix("GEQ"):
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                let b = stack.removeLast(); let a = stack.removeLast(); stack.append(a >= b ? 1 : 0)
            case let op where op.hasPrefix("GRT"):
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                let b = stack.removeLast(); let a = stack.removeLast(); stack.append(a > b ? 1 : 0)
            case "LAND":
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                let rb = stack.removeLast(); let ra = stack.removeLast(); stack.append((ra != 0 && rb != 0) ? 1 : 0)
            case "LOR":
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }
                let rb2 = stack.removeLast(); let ra2 = stack.removeLast(); stack.append((ra2 != 0 || rb2 != 0) ? 1 : 0)
            case "LNOT":
                guard stack.count >= 1 else { throw SimulatorError.stackUnderflow }
                let rv = stack.removeLast(); stack.append(rv == 0 ? 1 : 0)
            case "INC":
                if let n = ins.args.first { guard stack.count >= 1 else { throw SimulatorError.stackUnderflow }; let top = stack.removeLast(); stack.append(top + n) }
            case "LOD", "LDO":
                var addr = ins.args.first ?? 0; addr = self.flatKey(forEncoded: addr); stack.append(memory[addr] ?? 0)
            case "LAO":
                var laoAddr = ins.args.first ?? 0; laoAddr = self.flatKey(forEncoded: laoAddr); stack.append(laoAddr)
            case "STL", "STR":
                guard stack.count >= 1 else { throw SimulatorError.stackUnderflow }; let value = stack.removeLast(); var addr = ins.args.first ?? 0; addr = self.flatKey(forEncoded: addr); memory[addr] = value
            case "LDB":
                var addr = ins.args.first ?? 0; addr = self.flatKey(forEncoded: addr); stack.append(memory[addr] ?? 0)
            case "LDP":
                if stack.count >= 1 {
                    let addr = stack.removeLast()
                    stack.append(memory[addr] ?? 0)
                } else { throw SimulatorError.stackUnderflow }
            case "STB":
                guard stack.count >= 1 else { throw SimulatorError.stackUnderflow }; let v = stack.removeLast(); var addr = ins.args.first ?? 0; addr = self.flatKey(forEncoded: addr); memory[addr] = v & 0xFF
            case "IND":
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }; let offset = stack.removeLast(); let base = stack.removeLast(); let effective = base + offset; stack.append(memory[effective] ?? 0)
            case "SIND":
                guard stack.count >= 3 else { throw SimulatorError.stackUnderflow }; let value = stack.removeLast(); let offset = stack.removeLast(); let base = stack.removeLast(); let effective = base + offset; memory[effective] = value
            case "UJP":
                nextPC = ins.args.first ?? nextPC
            case "FJP":
                guard stack.count >= 1 else { throw SimulatorError.stackUnderflow }; let cond = stack.removeLast(); if cond == 0 { nextPC = ins.args.first ?? nextPC }
            case let op where op.hasPrefix("EQL"):
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }; let b = stack.removeLast(); let a = stack.removeLast(); stack.append(a == b ? 1 : 0)
            case let op where op.hasPrefix("NEQ"):
                guard stack.count >= 2 else { throw SimulatorError.stackUnderflow }; let b = stack.removeLast(); let a = stack.removeLast(); stack.append(a != b ? 1 : 0)
            default:
                throw SimulatorError.unknownOpcode(ins.mnemonic)
            }
            return (nextPC, nil, false)
        }
    }
}

// Converter: derive SimInsn sequence from decoded Procedure.instructions map
// Helper: encode a (segment, addr) pair into a single Int to use as a flat address in the simulator.
// Encode a location as a compact Int: [segment:8][procOrLex:8][addr:16]
// Encode a location as a compact Int: [segment:8][procOrLex:8][addr:16]
// If isLex is true, the high bit of procOrLex is set to indicate lexical-level addressing.
fileprivate func encodeLocation(segment: Int, procOrLex: Int, addr: Int, isLex: Bool = false) -> Int {
    let s = (segment & 0xff) << 24
    var p = (procOrLex & 0xff)
    if isLex { p = p | 0x80 }
    let psh = p << 16
    let a = addr & 0xffff
    return s | psh | a
}

public func simInsns(from proc: Procedure) -> [SimInsn] {
    // Convert instructions; if memLocation or destination is present, encode that
    // into a numeric address using encodeLocation(segment, procOrLex, addr).
    return proc.instructions.keys.sorted().map { ic in
        let ins = proc.instructions[ic]!
        var args = ins.params

        if let loc = ins.memLocation, let addr = loc.addr {
            let seg = loc.segment
            let procOrLex = loc.lexLevel ?? loc.procedure ?? 0
            let isLex = (loc.lexLevel != nil)
            let encoded = encodeLocation(segment: seg, procOrLex: procOrLex, addr: addr, isLex: isLex)
            args.insert(encoded, at: 0)
        } else if let dest = ins.destination, let addr = dest.addr {
            let seg = dest.segment
            let procOrLex = dest.lexLevel ?? dest.procedure ?? 0
            let isLex = (dest.lexLevel != nil)
            let encoded = encodeLocation(segment: seg, procOrLex: procOrLex, addr: addr, isLex: isLex)
            args.insert(encoded, at: 0)
        }

        return SimInsn(ic: ic, mnemonic: ins.mnemonic, args: args)
    }
}


