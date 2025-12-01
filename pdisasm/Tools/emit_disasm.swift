import Foundation
import pdisasm

if CommandLine.arguments.count < 2 {
    print("Usage: emit_disasm <file>")
    exit(1)
}

let filename = CommandLine.arguments[1]
let fileURL = URL(fileURLWithPath: filename)
guard let binaryData = try? Data(contentsOf: fileURL) else {
    print("Unable to read file")
    exit(2)
}

// Minimal segment parsing similar to main; reuse Data extensions
let diskInfo = binaryData.subdata(in: 0..<64)
let segName = binaryData.subdata(in: 64..<192)
let segKind = binaryData.subdata(in: 192..<224)
let textAddr = binaryData.subdata(in: 224..<256)
let segInfo = binaryData.subdata(in: 256..<288)
let intrinsSegs = binaryData.subdata(in: 288..<296)
let comment = binaryData.subdata(in: 433..<512)

var segTable: [Int: Segment] = [:]
for i in 0...15 {
    let codeaddr = diskInfo.readWord(at: i * 4)
    let codeleng = diskInfo.readWord(at: i * 4 + 2)
    var name = ""
    for j in 0...7 {
        name.append(String(UnicodeScalar(Int(segName[i * 8 + j]))!))
    }
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
    for j in 0..<8 {
        if (value >> j) & 1 == 1 {
            intrinsicSet.insert(UInt8(i * 8 + j))
        }
    }
}

let commentStr = comment.filter({ $0 > 0 }).compactMap({ UnicodeScalar($0) }).map(String.init).joined()

let segDict = SegDictionary(segTable: segTable, intrinsics: intrinsicSet, comment: commentStr)

// For snapshot we create empty collections and call outputResults directly
let codeSegs: [Int: CodeSegment] = [:]
let allLocations: Set<Location> = []
let allLabels: Set<Location> = []
let allProcedures: [ProcIdentifier] = []
let allCallers: Set<Call> = []

outputResults(sourceFilename: fileURL.lastPathComponent, segDictionary: segDict, codeSegs: codeSegs, allLocations: allLocations, allLabels: allLabels, allProcedures: allProcedures, allCallers: allCallers)
