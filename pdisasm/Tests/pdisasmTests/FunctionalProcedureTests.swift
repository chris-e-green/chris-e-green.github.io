import XCTest
@testable import pdisasm

final class FunctionalProcedureTests: XCTestCase {
    func testDecodeMinimalProcedure() throws {
        // Build a minimal procedure byte sequence.
        // Layout (little-endian words):
        // 0: 0xAD (RNP), 1: 0x00 (retCount)
        // 2..3: dataSize word = 0x0002 -> dataSize >> 1 == 1
        // 4..5: parameterSize word = 0x0004 -> >>1 == 2
        // 6..7: exit self-ref word = 0x0006  (exitIC = 6 - 6 == 0)
        // 8..9: enter self-ref word = 0x0008 (enterIC = 8 - 8 == 0)
        // 10: procNumber, 11: lexicalLevel
        let arr: [UInt8] = [
            0xAD, 0x00,
            0x02, 0x00,
            0x04, 0x00,
            0x06, 0x00,
            0x08, 0x00,
            0x01, 0x05
        ]
        let code = Data(arr)

        var proc = Procedure()
        proc.procType = ProcIdentifier(isFunction: false, segmentNumber: 1, procNumber: 1)

        var knownNames: [Int: Name] = [:]
        var callers: Set<Call> = []
        var globals: Set<Int> = []
        var baseLocs: Set<Int> = []
        var allLocations: Set<Location> = []
        var allProcedures: [ProcIdentifier] = []

        let seg = Segment(codeaddr: 0, codeleng: code.count, name: "SEGT", segkind: .dataseg, textaddr: 0, segNum: 1, mType: 0, version: 0)

        // addr points to the procedure header (procNumber at index 10)
        let addr = 10

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

        // Validate that the header was parsed correctly
        XCTAssertEqual(proc.lexicalLevel, 5)
        XCTAssertEqual(proc.enterIC, 0)
        XCTAssertEqual(proc.exitIC, 0)
        XCTAssertEqual(proc.parameterSize, 2)
        XCTAssertEqual(proc.dataSize, 1)

        // Instruction at IC 0 should be RNP (return nonbase procedure)
        XCTAssertEqual(proc.instructions[0]?.mnemonic, "RNP")
    }
}
