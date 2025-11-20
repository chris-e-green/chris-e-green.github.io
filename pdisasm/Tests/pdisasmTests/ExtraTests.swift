import XCTest
@testable import pdisasm

final class ExtraTests: XCTestCase {
    func testDataReadBigAndSelfRef() throws {
        // data: [0x81, 0x02] -> BIG = (0x81 - 0x80) << 8 | 0x02 = 0x0102 = 258
        let arr: [UInt8] = [0x81, 0x02, 0x34, 0x12]
        let data = Data(arr)
    let cd1 = CodeData(data: data, ipc: 0, header: 0)
    let (val, len) = try cd1.readBig(at: 0)
    XCTAssertEqual(val, 0x0102)
    XCTAssertEqual(len, 2)

    // self ref pointer at index 2 contains word 0x1234 -> getSelfRefPointer(2) == 2 - 0x1234
    let cd2 = CodeData(data: data, ipc: 0, header: 0)
    XCTAssertEqual(try cd2.getSelfRefPointer(at: 2), 2 - 0x1234)
    }

    func testCodeDataStringAndArrays() throws {
        // [len=3,'a','b','c', 0x02, 0x00] -> readString should return "abc", readWordArray(1) should return [0x0002]
        var cd = CodeData(data: Data([0x03, 0x61, 0x62, 0x63, 0x02, 0x00]), ipc: 0, header: 0)
        let s = try cd.readString()
        XCTAssertEqual(s, "abc")
        let words = try cd.readWordArray(count: 1)
        XCTAssertEqual(words, [0x0002])
    }

    func testCodeDataReadAddressForward() throws {
        // construct a small data where readAddress reads a forward offset
        // layout: [offset=0x02] means forward offset 2 -> destination ipc + offset + 1
        var cd = CodeData(data: Data([0x02, 0x00, 0x00, 0x00]), ipc: 0, header: 0)
        let dest = try cd.readAddress()
        // after reading 1 byte, ipc==1; return should be ipc + offset + 1 = 1 + 2 + 1 = 4
        XCTAssertEqual(dest, 4)
    }

    func testCodeDataReadAddressBackward() throws {
        // construct a small data where offset > 0x7F -> uses jump table entry at header + offset - 256
        // we'll craft header such that jte points to index 2 and place a word value 0x0002 there
        // When jte=2 and word at 2 == 0x0002, returned address = jte - word = 2 - 2 = 0
        var arr: [UInt8] = [0x00, 0x00, 0x02, 0x00]
        // put a high-offset byte at ipc 0 of 0x80 (128) so jte = header + 128 - 256 = header - 128
        // set header = 130 so jte = 2
        arr[0] = 0x80
        var cd = CodeData(data: Data(arr), ipc: 0, header: 130)
        let dest = try cd.readAddress()
        XCTAssertEqual(dest, 0)
    }
}
