package procedure

import "pdisasm-go/internal/types"

type Procedure struct {
	LexicalLevel  int
	EnterIC       int
	ExitIC        int
	ParameterSize int
	DataSize      int
	ProcType      *ProcIdentifier
	Variables     []string
	Instructions  map[int]*types.Instruction
	EntryPoints   map[int]bool
	Callers       map[*ProcIdentifier]bool
}

func NewProcedure() *Procedure {
	return &Procedure{
		Variables:    []string{},
		Instructions: make(map[int]*types.Instruction),
		EntryPoints:  make(map[int]bool),
		Callers:      make(map[*ProcIdentifier]bool),
	}
}
