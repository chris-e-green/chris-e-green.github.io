public class Procedure {
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
