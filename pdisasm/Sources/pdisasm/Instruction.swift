public class Instruction {
    public var opcode: UInt8
    public var mnemonic: String
    public var params: [Int] = []
    public var stringParameter: String?
    public var comparatorDataType: String
    public var memLocation: Location?
    public var destination: Location?
    public var comment: String?
    public var isPascal: Bool = true
    public var stackState: [String]?
    public var prePseudoCode: [String]  // pseudo-code to print before instruction
    public var pseudoCode: String?  // pseudo-code to print after instruction

    public init(
        opcode: UInt8,
        mnemonic: String,
        params: [Int] = [],
        stringParameter: String? = nil,
        comparatorDataType: String = "",
        memLocation: Location? = nil,
        destination: Location? = nil,
        comment: String? = nil,
        isPascal: Bool = true,
        stackState: [String]? = nil,
        pseudoCode: String? = nil,
        prePseudoCode: [String] = []
    ) {
        self.opcode = opcode
        self.mnemonic = mnemonic
        self.params = params
        self.stringParameter = stringParameter
        self.comparatorDataType = comparatorDataType
        self.memLocation = memLocation
        self.destination = destination
        self.comment = comment
        self.isPascal = isPascal
        self.stackState = stackState
        self.pseudoCode = pseudoCode
        self.prePseudoCode = prePseudoCode
    }
}
