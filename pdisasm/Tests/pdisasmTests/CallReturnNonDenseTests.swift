import XCTest
@testable import pdisasm

final class CallReturnNonDenseTests: XCTestCase {
    func testCallPushesReturnIPAndCreatesFrameNonDense() throws {
        var proc = Procedure()
        proc.enterIC = 100
        proc.exitIC = 120
        proc.procType = ProcIdentifier(isFunction: false, segmentNumber: 0, segmentName: "PASCALSY", procNumber: 1)

        // Non-dense caller: 100,110,120
        proc.instructions[100] = Instruction(mnemonic: "SLDC", params: [7])
        proc.instructions[110] = Instruction(mnemonic: "CIP", params: [2]) // call proc #2
        proc.instructions[120] = Instruction(mnemonic: "RNP", params: [])

        let insns = simInsns(from: proc)
        let sortedICs = insns.map { $0.ic }.sorted()
        let insMap: [Int: SimInsn] = Dictionary(uniqueKeysWithValues: insns.map { ($0.ic, $0) })

        let machine = Machine()
        var pc = proc.enterIC

        // step SLDC
        guard let sldc = insMap[pc] else { XCTFail("missing sldc"); return }
        let d1 = sortedICs.firstIndex(of: pc).flatMap { idx in idx + 1 < sortedICs.count ? sortedICs[idx + 1] : nil }
        let (n1, _, _) = try machine.executeStep(ins: sldc, currentPC: pc, defaultNextPC: d1)
        XCTAssertEqual(n1, 110)
        XCTAssertEqual(machine.stack, [7])
        pc = n1

        // step CIP (call)
        guard let callIns = insMap[pc] else { XCTFail("missing call"); return }
        let d2 = sortedICs.firstIndex(of: pc).flatMap { idx in idx + 1 < sortedICs.count ? sortedICs[idx + 1] : nil }
        let (n2, callProc, returned) = try machine.executeStep(ins: callIns, currentPC: pc, defaultNextPC: d2)
        XCTAssertEqual(callProc, 2)
        XCTAssertFalse(returned)
        // return IP should be pushed (defaultNextPC)
        XCTAssertEqual(machine.stack.last, d2)
        // a frame should be created (MP not nil)
        XCTAssertNotNil(machine.MP)
    }

    func testCalleeRNPSignalsReturn() throws {
        var proc = Procedure()
        proc.enterIC = 200
        proc.exitIC = 210
        proc.procType = ProcIdentifier(isFunction: false, segmentNumber: 0, segmentName: "PASCALSY", procNumber: 2)

        proc.instructions[200] = Instruction(mnemonic: "SLDC", params: [3])
        proc.instructions[210] = Instruction(mnemonic: "RNP", params: [])

        let insns = simInsns(from: proc)
        let sortedICs = insns.map { $0.ic }.sorted()
        let insMap: [Int: SimInsn] = Dictionary(uniqueKeysWithValues: insns.map { ($0.ic, $0) })

        let machine = Machine()
        var pc = proc.enterIC

        // step SLDC
        guard let i1 = insMap[pc] else { XCTFail("missing i1"); return }
        let d1 = sortedICs.firstIndex(of: pc).flatMap { idx in idx + 1 < sortedICs.count ? sortedICs[idx + 1] : nil }
        let (n1, _, _) = try machine.executeStep(ins: i1, currentPC: pc, defaultNextPC: d1)
        XCTAssertEqual(n1, 210)
        XCTAssertEqual(machine.stack, [3])
        pc = n1

        // step RNP -> should signal return
        guard let rnp = insMap[pc] else { XCTFail("missing rnp"); return }
        let (_, _, returned) = try machine.executeStep(ins: rnp, currentPC: pc, defaultNextPC: nil)
        XCTAssertTrue(returned)
    }
}
