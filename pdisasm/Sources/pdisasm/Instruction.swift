public struct PseudoCode { 
    public var code: String
    public var indentLevel: Int
}

public class Instruction {
    public var mnemonic: String
    public var params: [Int] = []
    public var memLocation: Location?
    public var destination: Location?
    public var comment: String?
    public var isPascal: Bool = true
    public var stackState: [String]
    public var prePseudoCode: [PseudoCode] // pseudo-code to print before instruction
    public var pseudoCode: PseudoCode? // pseudo-code to print after instruction

    public init(mnemonic: String, params: [Int] = [], memLocation: Location? = nil, destination: Location? = nil, comment: String? = nil, isPascal: Bool = true, stackState: [String], pseudoCode: PseudoCode? = nil, prePseudoCode: [PseudoCode] = []) {
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