import XCTest
@testable import pdisasm
import Foundation

final class BinaryFixtureSnapshotTests: XCTestCase {
    func testBinaryFixtureSnapshot() throws {
        let binURL = URL(fileURLWithPath: "Tests/Fixtures/sample.bin")
        let data = try Data(contentsOf: binURL)
        // load snapshot and verify it records the same size as the binary
        let snapURL = URL(fileURLWithPath: "Tests/Fixtures/sample_bin_snapshot.txt")
        let snap = try String(contentsOf: snapURL)
        XCTAssertTrue(snap.contains("Filename: sample.bin"))
        // parse size from snapshot and compare to actual data length
        if let sizeLine = snap.split(separator: "\n").first(where: { $0.hasPrefix("Size:") }) {
            let parts = sizeLine.split(separator: ":").map({ $0.trimmingCharacters(in: .whitespaces) })
            if parts.count > 1, let declared = Int(parts[1]) {
                XCTAssertEqual(data.count, declared)
            } else {
                XCTFail("Could not parse Size from snapshot")
            }
        } else {
            XCTFail("Snapshot missing Size line")
        }
    }
}
