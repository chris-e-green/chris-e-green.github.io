enum SegmentKind: Int {
    case linked, hostseg, segproc, unitseg, seprtseg, unlinked_intrins,
        linked_intrins, dataseg
}

struct Segment: CustomStringConvertible {
    var codeaddr: Int
    var codeleng: Int
    var name: String = ""
    var segkind: SegmentKind = .dataseg
    var textaddr: Int = 0
    var segNum: Int = 0
    var mType: Int = 0
    var version: Int = 0
    var description: String {
        return
            "| \(segNum) | \(name) | \(String(format:"%04X",codeaddr)) | \(codeleng) | \(segkind) | \(String(format:"%04X",textaddr)) | \(mType) | \(version) |"
    }
}

struct SegDictionary: CustomStringConvertible {
    var segTable: [Int: Segment]
    var intrinsics: Set<UInt8>
    var comment: String

    var description: String {
        let sortedSegments = segTable.sorted(by: {
            $0.value.codeaddr < $1.value.codeaddr
        })
        var components = [
            "## Segment Table",
            "| slot | segNum | name | block | length | kind | textAddr | mType | version |",
            "|-----:|-------:|------|------:|-------:|------|---------:|-------|--------:|",
        ]
        components.reserveCapacity(components.count + sortedSegments.count + 3)
        for (slot, v) in sortedSegments { components.append("| \(slot) \(v)") }
        components.append(contentsOf: [
            "",
            "intrinsics: \(intrinsics)",
            "",
            "comment: \(comment)",
        ])
        return components.joined(separator: "\n")
    }

    init(segTable: [Int: Segment], intrinsics: Set<UInt8>, comment: String) {
        self.segTable = segTable
        self.intrinsics = intrinsics
        self.comment = comment
    }
}
