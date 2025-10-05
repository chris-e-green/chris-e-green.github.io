struct Procedure {
    var lexicalLevel: Int = 0
    var procedureNumber: Int = 0
    var enterIC: Int = 0
    var exitIC: Int = 0
    var parameterSize: Int = 0
    var dataSize: Int = 0
    var jumpTable: [Int] = []
    var code: [Int] = []
    var header: String?
    var name: String?
    var variables: [String] = []
    var instructions: [Int: String] = [:]
    var entryPoints: Set<Int> = []
    var callers: Set<Int> = []
}

struct ProcedureDictionary {
    var segmentNumber: Int
    var procedureCount: Int
    var procedurePointers: [Int]
}
