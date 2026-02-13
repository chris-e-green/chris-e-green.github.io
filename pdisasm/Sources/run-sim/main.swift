import Foundation
import pdisasm

// Small demo: build a simple Procedure that pushes 5 and 3 then adds them.
var proc = Procedure()
proc.enterIC = 0
proc.exitIC = 3
proc.procType = ProcIdentifier(isFunction: false, segment: 0, segmentName: "PASCALSY", procedure: 1)

proc.instructions[0] = Instruction(opcode: 5, mnemonic: "SLDC", params: [5], stackState: [])
proc.instructions[1] = Instruction(opcode: 3, mnemonic: "SLDC", params: [3], stackState: [])
proc.instructions[2] = Instruction(opcode: 0x82, mnemonic: "ADI", params: [], stackState: [])
proc.instructions[3] = Instruction(opcode: 0xad, mnemonic: "RNP", params: [], stackState: [])

// Convert Procedure to SimInsn list and run via Machine.execute so we can capture
// and display a step-by-step trace with stack and memory diffs.
let insns = simInsns(from: proc)

func prettyStack(_ s: [Int]) -> String { "[" + s.map(String.init).joined(separator: ", ") + "]" }
func prettyMemory(_ m: [Int: Int]) -> String { "{" + m.map { "\($0.key):\($0.value)" }.sorted().joined(separator: ", ") + "}" }

do {
    let machine = Machine()
    var pc = proc.enterIC
    let insMap: [Int: SimInsn] = Dictionary(uniqueKeysWithValues: insns.map { ($0.ic, $0) })
    // Precompute sorted ICs so we can compute the correct "next" PC when ICs are non-dense
    let sortedICs = insns.map { $0.ic }.sorted()

    print("Starting simulation (step-by-step):\n")
    print(String(format: "PC  | INSN         | STACK (before) -> (after) | MP | MEMORY DIFF"))
    print(String(repeating: "-", count: 80))

    while true {
        guard let ins = insMap[pc] else { break }
        let stackBefore = machine.stack
        let memBefore = machine.currentMemory()

        // Compute defaultNextPC (the next instruction IC) so stepping uses the fixed increment
        let defaultNextPC: Int? = {
            if let idx = sortedICs.firstIndex(of: pc), idx + 1 < sortedICs.count {
                return sortedICs[idx + 1]
            }
            return nil
        }()

        // Execute single step (pass defaultNextPC to get correct next PC behavior)
        let (nextPC, callProc, returned) = try machine.executeStep(ins: ins, currentPC: pc, defaultNextPC: defaultNextPC)

        // Capture after state
        let stackAfter = machine.stack
        let memAfter = machine.currentMemory()

        // compute memory diff
        let memDiffKeys = Set(memBefore.keys).union(memAfter.keys)
        let memDiff = memDiffKeys.compactMap { k -> String? in
            let b = memBefore[k] ?? 0
            let a = memAfter[k] ?? 0
            return b == a ? nil : "\(k): \(b) -> \(a)"
        }.joined(separator: ", ")

    // Safe Swift printing (avoid C-style %s/%@ formatting to prevent crashes)
    let pcStr = String(format: "%04x", pc)
    let insStr = ins.mnemonic.padding(toLength: 12, withPad: " ", startingAt: 0)
    let beforeStr = prettyStack(stackBefore).padding(toLength: 12, withPad: " ", startingAt: 0)
    let afterStr = prettyStack(stackAfter).padding(toLength: 12, withPad: " ", startingAt: 0)
    let mpStr = machine.MP == nil ? "nil" : String(machine.MP!)
    let memDiffStr = memDiff.isEmpty ? "-" : memDiff
    print("\(pcStr) | \(insStr) | \(beforeStr) -> \(afterStr) | \(mpStr) | \(memDiffStr)")

        if let callProc = callProc {
            // For this simple demo we don't have procMap; log the call and advance
            print("    -> Call to proc \(callProc) (external in demo)")
        }

        if returned {
            print("    -> Return signalled")
            if let ret = machine.popReturnIP() {
                _ = machine.popFrame()
                pc = ret
                if pc >= insMap.keys.max() ?? pc { break }
                continue
            } else {
                break
            }
        }

        pc = nextPC
    }

    print("\nFinal machine state:")
    print("  Stack: \(prettyStack(machine.stack))")
    print("  Memory: \(prettyMemory(machine.currentMemory()))")
    print("  MP: \(machine.MP == nil ? "nil" : String(machine.MP!))")
    print("  Trace: \(machine.currentTrace().map({ String(format: "%04x:%@", $0.0, $0.1) }))")

} catch {
    print("Simulation error: \(error)")
}
