package procedure

type ProcedureDictionary struct {
	Segment           int
	ProcedureCount    int
	ProcedurePointers []int
}

func NewProcedureDictionary(segment, procedureCount int, procedurePointers []int) *ProcedureDictionary {
	return &ProcedureDictionary{
		Segment:           segment,
		ProcedureCount:    procedureCount,
		ProcedurePointers: procedurePointers,
	}
}
