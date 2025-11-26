import XCTest

@testable import pdisasm

final class SimulatorTests: XCTestCase {
    func testArithmeticSimple() throws {
        let insns: [SimInsn] = [
            SimInsn(ic: 0, mnemonic: "SLDC", args: [2]),
            SimInsn(ic: 1, mnemonic: "SLDC", args: [3]),
            SimInsn(ic: 2, mnemonic: "ADI"),
            SimInsn(ic: 3, mnemonic: "RNP")
        ]

        let m = Machine()
        let res = try m.execute(instructions: insns, entryIC: 0)
        XCTAssertTrue(res.halted)
        XCTAssertEqual(res.stack, [5])
        XCTAssertEqual(res.trace.map { $0.1 }, ["SLDC", "SLDC", "ADI", "RNP"])
    }

    func testStoreLoadMemory() throws {
        let insns: [SimInsn] = [
            SimInsn(ic: 0, mnemonic: "SLDC", args: [42]),
            SimInsn(ic: 1, mnemonic: "STL", args: [10]),
            SimInsn(ic: 2, mnemonic: "LOD", args: [10]),
            SimInsn(ic: 3, mnemonic: "RNP")
        ]

        let m = Machine()
        let res = try m.execute(instructions: insns, entryIC: 0)
        XCTAssertTrue(res.halted)
        XCTAssertEqual(res.stack, [42])
        XCTAssertEqual(res.memory[10], 42)
    }

    func testConvertProcedureAndRun() throws {
        var p = Procedure()
        p.instructions[0] = Instruction(mnemonic: "SLDC", params: [7], stackState: [])
        p.instructions[1] = Instruction(mnemonic: "SLDC", params: [8], stackState: [])
        p.instructions[2] = Instruction(mnemonic: "MPI", stackState: [])
        p.instructions[3] = Instruction(mnemonic: "RNP", stackState: [])

        let insns = simInsns(from: p)
        let m = Machine()
        let res = try m.execute(instructions: insns, entryIC: 0)
        XCTAssertEqual(res.stack, [56])
    }

    func testEncodedAddressLoadStore() throws {
        // Create an instruction with memLocation encoded as segment 1 addr 42
        var p = Procedure()
        let loc = Location(segment: 1, procedure: nil, lexLevel: nil, addr: 42)
        var ins = Instruction(mnemonic: "STL", params: [], stackState: [])
        ins.memLocation = loc
        p.instructions[0] = Instruction(mnemonic: "SLDC", params: [123], stackState: [])
        p.instructions[1] = ins
        // LOD should get value at same encoded location
        var lod = Instruction(mnemonic: "LOD", params: [], stackState: [])
        lod.memLocation = loc
        p.instructions[2] = lod
        p.instructions[3] = Instruction(mnemonic: "RNP", stackState: [])

        let insns = simInsns(from: p)
        let m = Machine()
        let res = try m.execute(instructions: insns, entryIC: 0)
        XCTAssertEqual(res.stack, [123])
    }

    func testLexicalLocalAddressing() throws {
        // memLocation with lexLevel should produce a distinct flat key vs global segment
        var p = Procedure()
        let localLoc = Location(segment: 0, procedure: nil, lexLevel: 1, addr: 8)
        var st = Instruction(mnemonic: "STL", params: [], stackState: [])
        st.memLocation = localLoc
        p.instructions[0] = Instruction(mnemonic: "SLDC", params: [5], stackState: [])
        p.instructions[1] = st
        var ld = Instruction(mnemonic: "LOD", params: [], stackState: [])
        ld.memLocation = localLoc
        p.instructions[2] = ld
        p.instructions[3] = Instruction(mnemonic: "RNP", stackState: [])

        let insns = simInsns(from: p)
        let m = Machine()
        // Enter a frame to ensure lex addressing resolves against a frame
        _ = m.enterFrame(base: 0x1000)
        let res = try m.execute(instructions: insns, entryIC: 0)
        XCTAssertEqual(res.stack, [5])
    }
}
