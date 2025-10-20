

struct Instruction {
    var mnemonic: String
    var params: [Int] = []
    var memLocation: Location?
    var destination: Location?
    var comment: String?
    var isPascal: Bool = true
}

struct Procedure {
    var lexicalLevel: Int = 0
    // var procedureNumber: Int = 0
    var enterIC: Int = 0
    var exitIC: Int = 0
    var parameterSize: Int = 0
    var dataSize: Int = 0
    // jumpTable and code were unused; removed to reduce dead state.
    // var header: String?
    var procType: ProcIdentifier?
    // var name: String?
    var variables: [String] = []
    var instructions: [Int: Instruction] = [:]
    var entryPoints: Set<Int> = []
    var callers: Set<ProcIdentifier> = []
}


struct ProcedureDictionary {
    var segmentNumber: Int
    var procedureCount: Int
    var procedurePointers: [Int]
}
