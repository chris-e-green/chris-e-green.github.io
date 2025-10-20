import XCTest
@testable import pdisasm

final class ExpandedFunctionalTests: XCTestCase {
    func testDecodeProcedureWithMultipleOpcodes() throws {
        // Construct a synthetic procedure code block with a few instructions:
        // IC=0: LDO (0xA9) with big value (single-byte BIG) value 0x02 -> LDO param [2]
        // IC=?: LAE (0xA7) seg=1 val=0x0003 (encoded as BIG 0x03)
        // Next: CIP (0xAE) procNum=2
        // Next: FJP (0xA1) offset=0x02 (forward jump)
        // Next: RNP (0xAD) retCount=0
        // We'll place a simple header at the end similar to previous tests.

        var bytes: [UInt8] = []
        // LDO opcode + BIG value (0x01..0x7F represents one-byte BIG)
        bytes += [0xA9, 0x02]
        // LAE: opcode 0xA7, seg=1, BIG value 0x03
        bytes += [0xA7, 0x01, 0x03]
        // CIP: opcode 0xAE, procNum=2
        bytes += [0xAE, 0x02]
        // FJP: opcode 0xA1, offset 0x02
        bytes += [0xA1, 0x02]
        // RNP: opcode 0xAD, retCount=0
        bytes += [0xAD, 0x00]

    // Add words for dataSize, parameterSize, exit/enter self refs, procNumber, lexicalLevel
    // dataSize=0x0002, parameterSize=0x0002
    // exit self-ref word should equal its pointer location so getSelfRefPointer -> ptr - word == 0
    // in this layout the exit self-ref word is at index 15 (0x000F) and enter at index 17 (0x0011)
    bytes += [0x02, 0x00, 0x02, 0x00, 0x0F, 0x00, 0x11, 0x00]
        // procNumber and lexicalLevel (procNumber=1, lexLevel=0)
        bytes += [0x01, 0x00]

        let code = Data(bytes)

        var proc = Procedure()
        proc.procType = ProcIdentifier(isFunction: false, segmentNumber: 1, procNumber: 1)

        var knownNames: [Int: Name] = [:]
        var callers: Set<Call> = []
        var globals: Set<Int> = []
        var baseLocs: Set<Int> = []
        var allLocations: Set<Location> = []
        var allProcedures: [ProcIdentifier] = []

        let seg = Segment(codeaddr: 0, codeleng: code.count, name: "SEGT", segkind: .dataseg, textaddr: 0, segNum: 1, mType: 0, version: 0)
        let addr = code.count - 2

        decodePascalProcedure(
            currSeg: seg,
            proc: &proc,
            knownNames: &knownNames,
            code: code,
            addr: addr,
            callers: &callers,
            globals: &globals,
            baseLocs: &baseLocs,
            allLocations: &allLocations,
            allProcedures: &allProcedures
        )

        // Validate parsed values
        XCTAssertEqual(proc.dataSize, 1)
        XCTAssertEqual(proc.parameterSize, 1)

        // Check that LDO instruction exists (at IC 0)
        XCTAssertEqual(proc.instructions[0]?.mnemonic, "LDO")
        XCTAssertEqual(proc.instructions[0]?.params.first, 2)

        // LAE should appear at IC 2 (opcode + seg + BIG)
        XCTAssertEqual(proc.instructions[2]?.mnemonic, "LAE")
        XCTAssertEqual(proc.instructions[2]?.params.first, 1)

        // CIP present
        // find instruction with mnemonic CIP
        let hasCIP = proc.instructions.values.contains(where: { $0.mnemonic == "CIP" })
        XCTAssertTrue(hasCIP)

        // FJP should have inserted an entry point (dest)
        XCTAssertFalse(proc.entryPoints.isEmpty)
    }
}
