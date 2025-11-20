import XCTest
@testable import pdisasm

final class CodeBlockTests: XCTestCase {
    func testCodeBlockExtractionInBounds() {
        // Create a data blob with two 512-byte blocks, fill block 1 with 0xAA
        var data = Data(repeating: 0x00, count: 1024)
        for i in (512..<1024) { data[i] = 0xAA }
        let seg = Segment(codeaddr: 1, codeleng: 512, name: "TST", segkind: .dataseg, textaddr: 0, segNum: 1, mType: 0, version: 0)
        // Use the helper from NoCrashIntegrationTests by re-implementing small logic here
    let block = codeBlock(for: seg, from: data)
        XCTAssertEqual(block.count, 512)
        XCTAssertTrue(block.allSatisfy({ $0 == 0xAA }))
    }

    func testCodeBlockExtractionOutOfBounds() {
        // Create a small data blob smaller than a single block
        let data = Data(repeating: 0x00, count: 100)
        let seg = Segment(codeaddr: 1, codeleng: 512, name: "TST", segkind: .dataseg, textaddr: 0, segNum: 1, mType: 0, version: 0)
    let block = codeBlock(for: seg, from: data)
        XCTAssertEqual(block.count, 0)
    }
}
