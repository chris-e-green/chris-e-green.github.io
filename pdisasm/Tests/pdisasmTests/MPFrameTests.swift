import XCTest

@testable import pdisasm

final class MPFrameTests: XCTestCase {
    func testEnterPopMP() throws {
        let m = Machine()
        XCTAssertNil(m.MP)

        let id1 = m.enterFrame(base: 0x1000)
        XCTAssertNotNil(m.MP)
        XCTAssertEqual(m.MP, 0x1000)

        let id2 = m.enterFrame(base: 0x2000)
        XCTAssertEqual(m.MP, 0x2000)

        let popped2 = m.popFrame()
        XCTAssertEqual(popped2, id2)
        XCTAssertEqual(m.MP, 0x1000)

        let popped1 = m.popFrame()
        XCTAssertEqual(popped1, id1)
        XCTAssertNil(m.MP)
    }

    func testDefaultBaseAllocation() throws {
        let m = Machine()
        XCTAssertNil(m.MP)
        // base == 0 should allocate a deterministic default base (id * 0x1000)
        let _ = m.enterFrame(base: 0)
        XCTAssertNotNil(m.MP)
        let mp = m.MP!
        XCTAssertTrue(mp % 0x1000 == 0, "MP should be a multiple of 0x1000")
        // pop and ensure MP resets
        _ = m.popFrame()
        XCTAssertNil(m.MP)
    }

    func testFrameIsolationLexicalAddressing() throws {
        let m = Machine()

        // Build SimInsns for storing a literal into a lexical location:
        // SLDC <val>
        // STL <encoded-lex-loc>
        // We'll execute steps directly (executeStep) so the machine isn't reset.

        let seg = 0
        let lex = 1
        let addr = 8
        // encodeLocation(segment: seg, procOrLex: lex, addr: addr, isLex: true)
        let encodedLex = ((seg & 0xff) << 24) | (((lex | 0x80) & 0xff) << 16) | (addr & 0xffff)

        let stA1 = SimInsn(ic: 0, mnemonic: "SLDC", args: [7])
        let stA2 = SimInsn(ic: 1, mnemonic: "STL", args: [encodedLex])

        let stB1 = SimInsn(ic: 10, mnemonic: "SLDC", args: [9])
        let stB2 = SimInsn(ic: 11, mnemonic: "STL", args: [encodedLex])

        // Enter first frame and store value 7
        _ = m.enterFrame(base: 0x1000)
        var pc = 0
        var res = try m.executeStep(ins: stA1, currentPC: pc)
        pc = res.nextPC
        _ = try m.executeStep(ins: stA2, currentPC: pc)

        // Enter second frame (without popping first) and store value 9 to same lexical offset
        _ = m.enterFrame(base: 0x2000)
        pc = 10
        res = try m.executeStep(ins: stB1, currentPC: pc)
        pc = res.nextPC
        _ = try m.executeStep(ins: stB2, currentPC: pc)

        let mem = m.currentMemory()
        // We should have two memory entries with values 7 and 9
        let values = Set(mem.values)
        XCTAssertTrue(values.contains(7))
        XCTAssertTrue(values.contains(9))
        XCTAssertGreaterThanOrEqual(mem.count, 2)
    }
}
