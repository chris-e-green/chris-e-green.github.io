import XCTest
@testable import pdisasm

final class RunSimNonDenseICTests: XCTestCase {
    func testNonDenseICStepping() throws {
        var proc = Procedure()
        proc.enterIC = 100
        proc.exitIC = 130
        proc.procType = ProcIdentifier(isFunction: false, segmentNumber: 0, segmentName: "PASCALSY", procNumber: 1)

        // Non-dense instruction layout: 100, 110, 120, 130
        proc.instructions[100] = Instruction(mnemonic: "SLDC", params: [1])
        proc.instructions[110] = Instruction(mnemonic: "SLDC", params: [2])
        proc.instructions[120] = Instruction(mnemonic: "ADI", params: [])
        proc.instructions[130] = Instruction(mnemonic: "RNP", params: [])

        let insns = simInsns(from: proc)
        let sortedICs = insns.map { $0.ic }.sorted()
        let insMap: [Int: SimInsn] = Dictionary(uniqueKeysWithValues: insns.map { ($0.ic, $0) })

        let machine = Machine()
        var pc = proc.enterIC

        // Step 1 -> should go from 100 -> 110
        guard let i1 = insMap[pc] else { XCTFail("missing ins1"); return }
        let defaultNext1 = sortedICs.firstIndex(of: pc).flatMap { idx in idx + 1 < sortedICs.count ? sortedICs[idx + 1] : nil }
        let (n1, _, _) = try machine.executeStep(ins: i1, currentPC: pc, defaultNextPC: defaultNext1)
        XCTAssertEqual(n1, 110)
        pc = n1

        // Step 2 -> should go from 110 -> 120
        guard let i2 = insMap[pc] else { XCTFail("missing ins2"); return }
        let defaultNext2 = sortedICs.firstIndex(of: pc).flatMap { idx in idx + 1 < sortedICs.count ? sortedICs[idx + 1] : nil }
        let (n2, _, _) = try machine.executeStep(ins: i2, currentPC: pc, defaultNextPC: defaultNext2)
        XCTAssertEqual(n2, 120)
        pc = n2

        // Step 3 -> ADI: should go from 120 -> 130 and leave stack [3]
        guard let i3 = insMap[pc] else { XCTFail("missing ins3"); return }
        let defaultNext3 = sortedICs.firstIndex(of: pc).flatMap { idx in idx + 1 < sortedICs.count ? sortedICs[idx + 1] : nil }
        let (n3, _, _) = try machine.executeStep(ins: i3, currentPC: pc, defaultNextPC: defaultNext3)
        XCTAssertEqual(n3, 130)

        XCTAssertEqual(machine.stack, [3])
    }
}
