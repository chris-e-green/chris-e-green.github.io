import XCTest
@testable import pdisasm
import Foundation

final class SnapshotTests: XCTestCase {
    func testOutputResultsSnapshot() throws {
        // Build minimal inputs to outputResults
        let segDict = SegDictionary(segTable: [:], intrinsics: Set<UInt8>(), comment: "")
        let codeSegs: [Int: CodeSegment] = [:]
        let allLocations: Set<Location> = []
        let allLabels: Set<Location> = []
        let allProcedures: [ProcIdentifier] = []
        let allCallers: Set<Call> = []

        // capture stdout
        let originalStdout = dup(STDOUT_FILENO)
        let pipefds = UnsafeMutablePointer<Int32>.allocate(capacity: 2)
        pipe(pipefds)
        fflush(stdout)
        dup2(pipefds[1], STDOUT_FILENO)

        // call the function
        outputResults(sourceFilename: "sample.bin", segDictionary: segDict, codeSegs: codeSegs, allLocations: allLocations, allLabels: allLabels, allProcedures: allProcedures, allCallers: allCallers)

        // restore stdout and read pipe
        fflush(stdout)
        dup2(originalStdout, STDOUT_FILENO)
        close(pipefds[1])
        let readFD = pipefds[0]
        var outData = Data()
        let bufferSize = 4096
        var buffer = [UInt8](repeating: 0, count: bufferSize)
        while true {
            let n = read(readFD, &buffer, bufferSize)
            if n <= 0 { break }
            outData.append(buffer, count: n)
        }
        close(readFD)

        // convert output to string
        guard let outStr = String(data: outData, encoding: .utf8) else {
            XCTFail("Unable to decode output as UTF-8")
            return
        }

        // Check for a few stable markers rather than exact snapshot equality.
        XCTAssertTrue(outStr.contains("#  sample.bin"), "Output missing filename header")
        XCTAssertTrue(outStr.contains("## Segment Table"), "Output missing segment table header")
        XCTAssertTrue(outStr.contains("## Globals"), "Output missing globals header")
    }
}
