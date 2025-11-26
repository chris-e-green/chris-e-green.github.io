import XCTest
@testable import pdisasm
import Foundation

final class GenerateDisasmSnapshot: XCTestCase {
    func testGenerateSnapshotIfRequested() throws {
        let env = ProcessInfo.processInfo.environment
        guard env["GENERATE_DISASM"] == "1" else {
            throw XCTSkip("Snapshot generation not requested")
        }

        let fixturePath = "Tests/Fixtures/sample.bin"
        let outPath = "Tests/Fixtures/sample_bin_disassembly.txt"

        let fileURL = URL(fileURLWithPath: fixturePath)
        let data = try Data(contentsOf: fileURL)

        // Minimal segment parsing similar to main
        let diskInfo = CodeData(data: data.subdata(in: 0..<64))
        let segName = data.subdata(in: 64..<192)
        let segKind = CodeData(data: data.subdata(in: 192..<224))
        let textAddr = CodeData(data: data.subdata(in: 224..<256))
        let segInfo = data.subdata(in: 256..<288)
        let intrinsSegs = data.subdata(in: 288..<296)
        let comment = data.subdata(in: 433..<512)

        var segTable: [Int: Segment] = [:]
        for i in 0...15 {
            let codeaddr = try diskInfo.readWord(at: i * 4)
            let codeleng = try diskInfo.readWord(at: i * 4 + 2)
            var name = ""
            for j in 0...7 {
                name.append(String(UnicodeScalar(Int(segName[i * 8 + j]))!))
            }
            name = name.trimmingCharacters(in: [" "])
            let kind = SegmentKind(rawValue: Int(try segKind.readWord(at: i * 2)))
            var segNum = Int(segInfo[i * 2])
            if segNum == 0 { segNum = i }
            let mType = Int(segInfo[i * 2 + 1] & 0x0F)
            let version = Int((segInfo[i * 2 + 1] & 0xE0) >> 5)
            let text = try textAddr.readWord(at: i * 2)
            if codeleng > 0 {
                segTable[i] = Segment(codeaddr: Int(codeaddr), 
                                      codeleng: Int(codeleng), 
                                      name: name, 
                                      segkind: kind ?? .dataseg, 
                                      textaddr: Int(text), 
                                      segNum: segNum, 
                                      mType: mType, 
                                      version: version)
            }
        }

        var intrinsicSet = Set<UInt8>()
        for (i, value) in intrinsSegs.enumerated().reversed() {
            for j in 0..<8 {
                if (value >> j) & 1 == 1 {
                    intrinsicSet.insert(UInt8(i * 8 + j))
                }
            }
        }

        let commentStr = comment.filter({ $0 > 0 }).compactMap({ UnicodeScalar($0) }).map(String.init).joined()

        let segDict = SegDictionary(segTable: segTable, intrinsics: intrinsicSet, comment: commentStr)

        // Prepare empty contexts to call outputResults
        let names: [Int: Name] = [:]
        let codeSegs: [Int: CodeSegment] = [:]
        let allLocations: Set<Location> = []
        let allLabels: Set<Location> = []
        let allProcedures: [ProcIdentifier] = []
        let allCallers: Set<Call> = []

        // Redirect stdout to the output file
        freopen(outPath, "w", stdout)
        outputResults(sourceFilename: fileURL.lastPathComponent, segDictionary: segDict, knownNames: names, codeSegs: codeSegs, allLocations: allLocations, allLabels: allLabels, allProcedures: allProcedures, allCallers: allCallers)
        fflush(stdout)
    }
}
