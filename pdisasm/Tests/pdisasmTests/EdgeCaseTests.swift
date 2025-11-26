import XCTest
@testable import pdisasm

final class EdgeCaseTests: XCTestCase {
    func testBigBoundaryValues() {
        // single-byte BIG (127)
        let data1 = CodeData(data: Data([0x7F]))
        XCTAssertEqual(try data1.readBig(at: 0).0, 127)

        // two-byte BIG: 0xFF, 0xEE -> (0xFF - 128) << 8 | 0xEE = 0x7FEE
        let data2 = CodeData(data: Data([0xFF, 0xEE]))
        XCTAssertEqual(try data2.readBig(at: 0).0, ((0xFF - 0x80) << 8) | 0xEE)
    }

    func testReadWordArrayMultipleWords() throws {
        // three words: 0x0102, 0x0304, 0x0506
        var cd = CodeData(data: Data([0x02,0x01,0x04,0x03,0x06,0x05]), ipc: 0, header: 0)
        let words = try cd.readWordArray(count: 3)
        XCTAssertEqual(words, [0x0102, 0x0304, 0x0506])
    }

    func testReadByteArrayOutOfBounds() throws {
        var cd = CodeData(data: Data([0x05, 0x01, 0x02]), ipc: 0, header: 0)
        XCTAssertThrowsError(try cd.readByteArray()) { error in
            XCTAssertEqual(error as? CodeDataError, CodeDataError.unexpectedEndOfData)
        }
    }

    func testReadStringUnexpectedEnd() throws {
        var cd = CodeData(data: Data([0x04, 0x61, 0x62]), ipc: 0, header: 0)
        XCTAssertThrowsError(try cd.readString()) { error in
            XCTAssertEqual(error as? CodeDataError, CodeDataError.unexpectedEndOfData)
        }
    }

    func testLargeJumpTableOffsetDoesNotCrash() throws {
        // ensure readAddress handles offsets referencing jump table safely (jte points to valid area)
    // prepare data where offset byte is 0x90 -> jte = header + 0x90 - 256
    // choose header = 114 so jte = 114 + 144 - 256 = 2 (within bounds)
    let arr: [UInt8] = [0x90, 0x00, 0x02, 0x00]
    var cd = CodeData(data: Data(arr), ipc: 0, header: 114)
    let _ = try cd.readAddress()
        // if no exception was thrown, the test passes
    }
}
