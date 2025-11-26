

public struct Instruction {
    public var mnemonic: String
    public var params: [Int] = []
    public var memLocation: Location?
    public var destination: Location?
    public var comment: String?
    public var isPascal: Bool = true
    public var stackState: [String]
    public var prePseudoCode: String? // pseudo-code to print before instruction
    public var pseudoCode: String? // pseudo-code to print after instruction

    public init(mnemonic: String, params: [Int] = [], memLocation: Location? = nil, destination: Location? = nil, comment: String? = nil, isPascal: Bool = true, stackState: [String], pseudoCode: String? = nil, prePseudoCode: String? = nil) {
        self.mnemonic = mnemonic
        self.params = params
        self.memLocation = memLocation
        self.destination = destination
        self.comment = comment
        self.isPascal = isPascal
        self.stackState = stackState
        self.pseudoCode = pseudoCode
        self.prePseudoCode = prePseudoCode
    }
}

public struct Procedure {
    public var lexicalLevel: Int = 0
    public var enterIC: Int = 0
    public var exitIC: Int = 0
    public var parameterSize: Int = 0
    public var dataSize: Int = 0
    public var procType: ProcIdentifier?
    public var variables: [String] = []
    public var instructions: [Int: Instruction] = [:]
    public var entryPoints: Set<Int> = []
    public var callers: Set<ProcIdentifier> = []

    public init() {}
}


public struct ProcedureDictionary {
    public var segmentNumber: Int
    public var procedureCount: Int
    public var procedurePointers: [Int]

    public init(segmentNumber: Int, procedureCount: Int, procedurePointers: [Int]) {
        self.segmentNumber = segmentNumber
        self.procedureCount = procedureCount
        self.procedurePointers = procedurePointers
    }
}
