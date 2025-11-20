public enum SegmentKind: Int {
    case linked, hostseg, segproc, unitseg, seprtseg, unlinked_intrins,
        linked_intrins, dataseg
}

public struct Segment: CustomStringConvertible {
    public var codeaddr: Int
    public var codeleng: Int
    public var name: String = ""
    public var segkind: SegmentKind = .dataseg
    public var textaddr: Int = 0
    public var segNum: Int = 0
    public var mType: Int = 0
    public var version: Int = 0

    public var description: String {
        return "Segment(name: \"\(name)\", codeaddr: \(String(format:"%04X", codeaddr)), len: \(codeleng))"
    }

    public init(codeaddr: Int, codeleng: Int, name: String, segkind: SegmentKind, textaddr: Int, segNum: Int, mType: Int, version: Int) {
        self.codeaddr = codeaddr
        self.codeleng = codeleng
        self.name = name
        self.segkind = segkind
        self.textaddr = textaddr
        self.segNum = segNum
        self.mType = mType
        self.version = version
    }
}

public struct SegDictionary: CustomStringConvertible {
    public var segTable: [Int: Segment]
    public var intrinsics: Set<UInt8>
    public var comment: String

    public var description: String {
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

    public init(segTable: [Int: Segment], intrinsics: Set<UInt8>, comment: String) {
        self.segTable = segTable
        self.intrinsics = intrinsics
        self.comment = comment
    }
}