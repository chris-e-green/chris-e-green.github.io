import XCTest
@testable import pdisasm

final class CodeDataErrorTests: XCTestCase {
    func testReadByteThrowsOnEOF() {
        var cd = CodeData(data: Data([]), ipc: 0, header: 0)
        XCTAssertThrowsError(try cd.readByte()) { error in
            XCTAssertEqual(error as? CodeDataError, CodeDataError.unexpectedEndOfData)
        }
    }

    func testReadWordThrowsOnEOF() {
        var cd = CodeData(data: Data([0x01]), ipc: 0, header: 0)
        XCTAssertThrowsError(try cd.readWord()) { error in
            XCTAssertEqual(error as? CodeDataError, CodeDataError.unexpectedEndOfData)
        }
    }

    func testReadBigThrowsOnEOFForTwoByte() {
        var cd = CodeData(data: Data([0xFF]), ipc: 0, header: 0)
        // 0xFF indicates a two-byte BIG; the next byte is missing
        XCTAssertThrowsError(try cd.readBig()) { error in
            XCTAssertEqual(error as? CodeDataError, CodeDataError.unexpectedEndOfData)
        }
    }

    func testReadAddressJumpTableOutOfBoundsThrows() {
        var cd = CodeData(data: Data([0x80]), ipc: 0, header: 10) // offset 0x80 -> jte = header + 128 - 256 = header - 128 => negative
        // readAddress should attempt to read a word at a computed jte, which will be out-of-bounds and throw
        XCTAssertThrowsError(try cd.readAddress()) { error in
            XCTAssertEqual(error as? CodeDataError, CodeDataError.unexpectedEndOfData)
        }
    }
}
