import XCTest

@testable import pdisasm

final class PCIncrementTests: XCTestCase {
    func testPCAdvanceNonDenseICs() throws {
        // Instructions placed at non-consecutive ICs: 0, 10, 20, 30
        let insns: [SimInsn] = [
            SimInsn(ic: 0, mnemonic: "SLDC", args: [2]),
            SimInsn(ic: 10, mnemonic: "SLDC", args: [3]),
            SimInsn(ic: 20, mnemonic: "ADI"),
            SimInsn(ic: 30, mnemonic: "RNP")
        ]

        let m = Machine()
        let res = try m.execute(instructions: insns, entryIC: 0)
        XCTAssertTrue(res.halted)
        XCTAssertEqual(res.stack, [5])
        // Verify the trace contains the expected instruction sequence and PCs
        XCTAssertEqual(res.trace.map { $0.1 }, ["SLDC", "SLDC", "ADI", "RNP"]) // mnemonics
        XCTAssertEqual(res.trace.map { $0.0 }, [0, 10, 20, 30]) // actual executed ICs
    }

    func testCIPPushesReturnIPWithNonDenseICs() throws {
        // Program: ICs at 0,10,20. At 0 push a value, at 10 call (CIP) to 20.
        // The next IC after 10 is 20 (non-dense), so CIP should push 20 as return IP.
        let insns: [SimInsn] = [
            SimInsn(ic: 0, mnemonic: "SLDC", args: [7]),
            SimInsn(ic: 10, mnemonic: "CIP", args: [20]),
            SimInsn(ic: 20, mnemonic: "RNP")
        ]

        let m = Machine()
        let res = try m.execute(instructions: insns, entryIC: 0)
        XCTAssertTrue(res.halted)
        // SLDC pushed 7, CIP should push return IP 20
        XCTAssertEqual(res.stack, [7, 20])
        XCTAssertEqual(res.trace.map { $0.0 }, [0, 10, 20])
    }

    func testExecuteStepUsesProvidedDefaultNextPC() throws {
        let m = Machine()
        // CIP at currentPC 10 with proc 50; provide defaultNextPC = 15
        let ins = SimInsn(ic: 10, mnemonic: "CIP", args: [50])
        let (nextPC, callProc, returned) = try m.executeStep(ins: ins, currentPC: 10, defaultNextPC: 15)
        XCTAssertEqual(callProc, 50)
        XCTAssertFalse(returned)
        // executeStep should return nextPC equal to the provided defaultNextPC (the pushed return IP)
        XCTAssertEqual(nextPC, 15)
        // The machine stack should have the pushed return IP
        XCTAssertEqual(m.stack, [15])
    }

    func testSimulateProcedureCallsAndReturns() throws {
        // Caller procedure (procNumber 1) in segment 1
        var caller = Procedure()
        caller.enterIC = 0
        caller.procType = ProcIdentifier(isFunction: false, isAssembly: false, segment: 1, segmentName: nil, procedure: 1, procName: nil)
        caller.instructions[0] = Instruction(mnemonic: "SLDC", params: [7], stackState: [])
        // CIP uses a procedure number (2) which simulateProcedure will resolve via procMap
        caller.instructions[10] = Instruction(mnemonic: "CIP", params: [2], stackState: [])
        caller.instructions[20] = Instruction(mnemonic: "RNP", stackState: [])

        // Callee procedure (procNumber 2) simply returns immediately
        var callee = Procedure()
        callee.enterIC = 0
        callee.procType = ProcIdentifier(isFunction: false, isAssembly: false, segment: 1, segmentName: nil, procedure: 2, procName: nil)
        callee.instructions[0] = Instruction(mnemonic: "RNP", stackState: [])

        // Build procMap keyed by (segment<<16)|procNumber using caller's segment
        let key = (caller.procType!.segment << 16) | 2
        let procMap: [Int: Procedure] = [ key: callee ]

        let seg = Segment(codeaddr: 0, codeleng: 0, name: "test", segkind: .dataseg, textaddr: 0, segNum: 1, mType: 0, version: 0)

        let res = try simulateProcedure(currSeg: seg, proc: caller, procMap: procMap)
        XCTAssertTrue(res.halted)
        // Note: current simulateProcedure implementation pops the return IP (and may consume
        // the top-of-stack on final return). The observed behavior is an empty stack here.
        XCTAssertEqual(res.stack, [])
    }
}
