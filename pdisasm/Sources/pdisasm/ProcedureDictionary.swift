public class ProcedureDictionary {
    public var segment: Int
    public var procedureCount: Int
    public var procedurePointers: [Int]

    public init(segment: Int, procedureCount: Int, procedurePointers: [Int]) {
        self.segment = segment
        self.procedureCount = procedureCount
        self.procedurePointers = procedurePointers
    }
}
