import XCTest
@testable import pdisasm
import Foundation

final class SnapshotProcTests: XCTestCase {
    func testOutputResultsWithProcedureSnapshot() throws {
        // Build a minimal seg dictionary and one code segment with an empty procedure
        let segDict = SegDictionary(segTable: [:], intrinsics: Set<UInt8>(), comment: "")
        let knownNames: [Int: Name] = [:]
        var codeSegs: [Int: CodeSegment] = [:]

        let proc = Procedure()
        let procDict = ProcedureDictionary(segmentNumber: 0, procedureCount: 0, procedurePointers: [])
        let cs = CodeSegment(procedureDictionary: procDict, procedures: [proc])
        codeSegs[0] = cs

        let allLocations: Set<Location> = []
        let allLabels: Set<LocationTwo> = []
        let allProcedures: [ProcIdentifier] = []
        let allCallers: Set<Call> = []

        // capture stdout similar to the other snapshot test
        let originalStdout = dup(STDOUT_FILENO)
        let pipefds = UnsafeMutablePointer<Int32>.allocate(capacity: 2)
        pipe(pipefds)
        fflush(stdout)
        dup2(pipefds[1], STDOUT_FILENO)

        outputResults(sourceFilename: "sample.bin", segDictionary: segDict, knownNames: knownNames, codeSegs: codeSegs, allLocations: allLocations, allLabels: allLabels, allProcedures: allProcedures, allCallers: allCallers)

        fflush(stdout)
        dup2(originalStdout, STDOUT_FILENO)
        close(pipefds[1])
        let readFD = pipefds[0]
        var outData = Data()
        var buffer = [UInt8](repeating: 0, count: 4096)
        while true {
            let n = read(readFD, &buffer, 4096)
            if n <= 0 { break }
            outData.append(buffer, count: n)
        }
        close(readFD)

        guard let outStr = String(data: outData, encoding: .utf8) else {
            XCTFail("Unable to decode output as UTF-8")
            return
        }

        // load fixture and check for key markers
        let _ = try String(contentsOf: URL(fileURLWithPath: "Tests/Fixtures/sample_snapshot_proc.txt"))
        XCTAssertTrue(outStr.contains("## Segment Unknown (0)"), "Missing segment header")
        XCTAssertTrue(outStr.contains("###  (* P="), "Missing procedure header")
    }
}
