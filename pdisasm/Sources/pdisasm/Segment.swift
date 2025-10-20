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
        return "Segment(name: \"\(name)\", codeaddr: \(String(format:"%04X", codeaddr)), len: \(codeleng))"
    }
}

struct SegDictionary: CustomStringConvertible {
    var segTable: [Int: Segment]
    var intrinsics: Set<UInt8>
    var comment: String

    var description: String {
        let sortedSegments = segTable.sorted { $0.value.codeaddr < $1.value.codeaddr }

        let tableRows = sortedSegments.map { (slot, segment) in
            return "| \(slot) | \(segment.segNum) | \(segment.name) | \(String(format:"%04X", segment.codeaddr)) | \(segment.codeleng) | \(segment.segkind) | \(String(format:"%04X", segment.textaddr)) | \(segment.mType) | \(segment.version) |"
        }

        return """
        ## Segment Table
        
        | slot | segNum | name | codeaddr | codeleng | kind | textAddr | mType | version |
        |-----:|-------:|------|---------:|---------:|------|---------:|-------|--------:|
        \(tableRows.joined(separator: "\n"))

        intrinsics: `\(intrinsics)`

        comment: \(comment)

        """
    }

    init(segTable: [Int: Segment], intrinsics: Set<UInt8>, comment: String) {
        self.segTable = segTable
        self.intrinsics = intrinsics
        self.comment = comment
    }
}