import XCTest
@testable import pdisasm
import Foundation

final class NoCrashIntegrationTests: XCTestCase {
    func testProcessRealFixtureDoesNotCrash() throws {
        let fixturePath = "Tests/Fixtures/sample.bin"
        let fileURL = URL(fileURLWithPath: fixturePath)
        let data = try Data(contentsOf: fileURL)

        // Reuse logic from main: build segDict and iterate segments, but don't assert output.
        let diskInfo = data.subdata(in: 0..<64)
        let segName = data.subdata(in: 64..<192)
        let segKind = data.subdata(in: 192..<224)
        let textAddr = data.subdata(in: 224..<256)
        let segInfo = data.subdata(in: 256..<288)
        let intrinsSegs = data.subdata(in: 288..<296)
        let comment = data.subdata(in: 433..<512)

        var segTable: [Int: Segment] = [:]
        for i in 0...15 {
            let codeaddr = diskInfo.readWord(at: i * 4)
            let codeleng = diskInfo.readWord(at: i * 4 + 2)
            var name = ""
            for j in 0...7 { name.append(String(UnicodeScalar(Int(segName[i * 8 + j]))!)) }
            name = name.trimmingCharacters(in: [" "])
            let kind = SegmentKind(rawValue: segKind.readWord(at: i * 2))
            var segNum = Int(segInfo[i * 2])
            if segNum == 0 { segNum = i }
            let mType = Int(segInfo[i * 2 + 1] & 0x0F)
            let version = Int((segInfo[i * 2 + 1] & 0xE0) >> 5)
            let text = textAddr.readWord(at: i * 2)
            if codeleng > 0 {
                segTable[i] = Segment(codeaddr: codeaddr, codeleng: codeleng, name: name, segkind: kind ?? .dataseg, textaddr: text, segNum: segNum, mType: mType, version: version)
            }
        }

        var intrinsicSet = Set<UInt8>()
        for (i, value) in intrinsSegs.enumerated().reversed() {
            for j in 0..<8 { if (value >> j) & 1 == 1 { intrinsicSet.insert(UInt8(i * 8 + j)) } }
        }

        let commentStr = comment.filter({ $0 > 0 }).compactMap({ UnicodeScalar($0) }).map(String.init).joined()
        let segDict = SegDictionary(segTable: segTable, intrinsics: intrinsicSet, comment: commentStr)

        // Now exercise the segment processing that previously crashed. Should not throw or crash.
        var allCodeSegs: [Int: CodeSegment] = [:]
        var allLocations: Set<Location> = []
        var allProcedures: [ProcIdentifier] = []
        var allLabels: [Location: LocInfo] = [:]
        var allCallers: Set<Call> = []
        var names: [Int: Name] = [:]

        for segment in segDict.segTable.sorted(by: { $0.key < $1.key }) {
            let seg = segment.value
            let code = data.getCodeBlock(at: seg.codeaddr, length: seg.codeleng)
            var offset = 0
            var extraCode: Data = Data()
            if seg.segNum == 0 || seg.segNum == 15 {
                if seg.name == "PASCALSY" {
                    if let extraSeg = segDict.segTable[15] {
                        extraCode = data.getCodeBlock(at: extraSeg.codeaddr, length: extraSeg.codeleng)
                        let pascalProcCount = Int(code[code.endIndex - 1])
                        let lastProcHdrLoc = code.endIndex - 2 - pascalProcCount * 2
                        let lastProcRelativeAddr = code.readWord(at: lastProcHdrLoc)
                        let lastProcAbsAddr = lastProcRelativeAddr - lastProcHdrLoc
                        offset = lastProcAbsAddr + extraCode.endIndex - 2
                    }
                }
            }

            var codeSeg = CodeSegment(procedureDictionary: ProcedureDictionary(segmentNumber: 0, procedureCount: 0, procedurePointers: []), procedures: [])
            // Build pointers safely
            if code.count >= 2 {
                codeSeg.procedureDictionary = ProcedureDictionary(segmentNumber: Int(code[code.endIndex - 2]), procedureCount: Int(code[code.endIndex - 1]), procedurePointers: [])
                for i in 1...codeSeg.procedureDictionary.procedureCount {
                    codeSeg.procedureDictionary.procedurePointers.append(code.getSelfRefPointer(at: code.endIndex - i * 2 - 2))
                }
            }

            // Exercise decode paths safely by attempting to decode but ensuring we don't crash.
            for (procIdx, procPtr) in codeSeg.procedureDictionary.procedurePointers.enumerated() {
                var proc = Procedure()
                var procGlobalLocs: Set<Int> = []
                var procBaseLocs: Set<Int> = []
                var inCode: Data
                var addr = procPtr
                if addr < 0 { inCode = extraCode; addr = addr + offset } else { inCode = code }

                // same safety checks as main
                let minNeededIndex = addr - 8
                let maxNeededIndex = addr + 1
                if minNeededIndex < 0 || maxNeededIndex >= inCode.count { continue }

                // call decoder; should not crash due to prior guards
                decodePascalProcedure(currSeg: seg, proc: &proc, knownNames: &names, code: inCode, addr: addr, callers: &allCallers, globals: &procGlobalLocs, baseLocs: &procBaseLocs, allLocations: &allLocations, allProcedures: &allProcedures)
            }

            allCodeSegs[Int(seg.segNum)] = codeSeg
        }

        // If we reach here, the processing did not crash.
        XCTAssertTrue(true)
    }
}
