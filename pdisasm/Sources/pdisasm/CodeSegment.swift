class CodeSegment {
    var procedureDictionary: ProcedureDictionary
    var procedures: [Procedure] = []
    
    init(procedureDictionary: ProcedureDictionary, procedures: [Procedure]) {
        self.procedureDictionary = procedureDictionary
        self.procedures = procedures
    }
}
