import XCTest
@testable import pdisasm

final class SmokeTests: XCTestCase {
    func testDataExtensionsReadWord() {
        // create a 4 byte data
        let arr: [UInt8] = [0x34, 0x12, 0x78, 0x56]
        let data = Data(arr)
        XCTAssertEqual(data.readWord(at: 0), 0x1234)
        XCTAssertEqual(data.readWord(at: 2), 0x5678)
    }

    func testCodeDataReadByteAndWord() throws {
        var data = CodeData(data: Data([0x01, 0x02, 0x03, 0x04]), ipc: 0, header: 0)
        XCTAssertEqual(try data.readByte(), 0x01)
        // after reading one byte, ipc==1 and the next word is bytes [0x02, 0x03] -> 0x0302
        XCTAssertEqual(try data.readWord(), 0x0302)
    }

    func testDecodeEmptyProcedures() throws {
        // ensure we can construct and inspect a Procedure without crashing
        var proc = Procedure()
        XCTAssertEqual(proc.instructions.count, 0)
        XCTAssertEqual(proc.entryPoints.count, 0)
        // set some values and ensure they persist
        proc.lexicalLevel = 1
        proc.procType = ProcIdentifier(isFunction: false, isAssembly: false, segmentNumber: 1, procNumber: 1, procName: "TEST")
        XCTAssertEqual(proc.procType?.procNumber, 1)
    }
}
