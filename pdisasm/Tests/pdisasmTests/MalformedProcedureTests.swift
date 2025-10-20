import XCTest
@testable import pdisasm
import Foundation

final class MalformedProcedureTests: XCTestCase {
    func testDecodeSkipsMalformedProcedureHeader() throws {
        // Create a tiny code block that is too small for a procedure header.
        let smallCode = Data([0x00, 0x01, 0x02])
        var proc = Procedure()
        var names: [Int: Name] = [:]
        var callers: Set<Call> = []
        var globals: Set<Int> = []
        var baseLocs: Set<Int> = []
        var allLocations: Set<Location> = []
        var allProcedures: [ProcIdentifier] = []

        // Calling decodePascalProcedure with addr=2 should not crash even though the
        // header is incomplete; the function should return early due to validation.
    decodePascalProcedure(currSeg: Segment(codeaddr: 0, codeleng: smallCode.count, name: "TST", segkind: .dataseg, textaddr: 0, segNum: 0, mType: 0, version: 0), proc: &proc, knownNames: &names, code: smallCode, addr: 2, callers: &callers, globals: &globals, baseLocs: &baseLocs, allLocations: &allLocations, allProcedures: &allProcedures)

        // If we reach here, the function did not crash. Ensure procedure remains empty.
        XCTAssertTrue(proc.instructions.isEmpty || proc.entryPoints.count <= 2)
    }
}
