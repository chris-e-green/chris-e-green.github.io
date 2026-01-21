package types

type PseudoCode struct {
	Code        string
	IndentLevel int
}

type Instruction struct {
	Bytes         []byte
	Mnemonic      string
	Params        []int
	MemLocation   *Location
	Destination   *Location
	Comment       *string
	IsPascal      bool
	StackState    []string
	PrePseudoCode []PseudoCode
	PseudoCode    *PseudoCode
}

func NewInstruction(bytes []byte, mnemonic string, params []int, memLoc, dest *Location, comment *string, isPascal bool, stackState []string, pseudoCode *PseudoCode, prePseudoCode []PseudoCode) *Instruction {
	return &Instruction{
		Bytes:         bytes,
		Mnemonic:      mnemonic,
		Params:        params,
		MemLocation:   memLoc,
		Destination:   dest,
		Comment:       comment,
		IsPascal:      isPascal,
		StackState:    stackState,
		PseudoCode:    pseudoCode,
		PrePseudoCode: prePseudoCode,
	}
}
