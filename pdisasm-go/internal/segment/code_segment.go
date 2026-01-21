package segment

import "pdisasm-go/internal/procedure"

type CodeSegment struct {
	ProcedureDictionary *procedure.ProcedureDictionary
	Procedures          []*procedure.Procedure
}

func NewCodeSegment(procDict *procedure.ProcedureDictionary, procedures []*procedure.Procedure) *CodeSegment {
	return &CodeSegment{
		ProcedureDictionary: procDict,
		Procedures:          procedures,
	}
}
