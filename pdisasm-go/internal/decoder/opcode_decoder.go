package decoder

import (
	"fmt"

	"pdisasm-go/internal/procedure"
	"pdisasm-go/internal/segment"
	"pdisasm-go/internal/types"
)

type OpcodeDecoder struct {
	CD *types.CodeData
}

func NewOpcodeDecoder(cd *types.CodeData) *OpcodeDecoder {
	return &OpcodeDecoder{CD: cd}
}

type DecodedInstruction struct {
	Opcode             uint8
	Mnemonic           string
	Params             []int
	BytesConsumed      int
	Comment            string
	MemLocation        *types.Location
	Destination        *types.Location
	RequiresComparator bool
	ComparatorOffset   int
}

func NewDecodedInstruction(opcode uint8, mnemonic string, params []int, bytesConsumed int, comment string, memLocation, destination *types.Location, requiresComparator bool, comparatorOffset int) *DecodedInstruction {
	if params == nil {
		params = []int{}
	}
	return &DecodedInstruction{
		Opcode:             opcode,
		Mnemonic:           mnemonic,
		Params:             params,
		BytesConsumed:      bytesConsumed,
		Comment:            comment,
		MemLocation:        memLocation,
		Destination:        destination,
		RequiresComparator: requiresComparator,
		ComparatorOffset:   comparatorOffset,
	}
}

func (od *OpcodeDecoder) Decode(
	opcode uint8,
	ic int,
	currSeg *segment.Segment,
	segment int,
	procedure int,
	proc *procedure.Procedure,
	addr int,
	allLocations map[string]*types.Location,
) (*DecodedInstruction, error) {

	// Helper to find or create location
	findLoc := func(seg, proc, lexLvl, addr int, useProcPtr, useLexLvlPtr, useAddrPtr bool) *types.Location {
		key := fmt.Sprintf("S%d", seg)
		if useProcPtr {
			key += fmt.Sprintf("_P%d", proc)
		}
		if useLexLvlPtr {
			key += fmt.Sprintf("_L%d", lexLvl)
		}
		if useAddrPtr {
			key += fmt.Sprintf("_A%d", addr)
		}

		if loc, ok := allLocations[key]; ok {
			return loc
		}

		var procPtr, lexLvlPtr, addrPtr *int
		if useProcPtr {
			p := proc
			procPtr = &p
		}
		if useLexLvlPtr {
			l := lexLvl
			lexLvlPtr = &l
		}
		if useAddrPtr {
			a := addr
			addrPtr = &a
		}
		return types.NewLocation(seg, procPtr, lexLvlPtr, addrPtr, "", "")
	}

	switch {
	case opcode <= SLDC127:
		return NewDecodedInstruction(opcode, "SLDC", []int{int(opcode)}, 1,
			fmt.Sprintf("Short load one-word constant %d", opcode), nil, nil, false, 0), nil

	case opcode == ABI:
		return NewDecodedInstruction(opcode, "ABI", nil, 1, "Absolute value of integer (TOS)", nil, nil, false, 0), nil
	case opcode == ABR:
		return NewDecodedInstruction(opcode, "ABR", nil, 1, "Absolute value of real (TOS)", nil, nil, false, 0), nil
	case opcode == ADI:
		return NewDecodedInstruction(opcode, "ADI", nil, 1, "Add integers (TOS + TOS-1)", nil, nil, false, 0), nil
	case opcode == ADR:
		return NewDecodedInstruction(opcode, "ADR", nil, 1, "Add reals (TOS + TOS-1)", nil, nil, false, 0), nil
	case opcode == LAND:
		return NewDecodedInstruction(opcode, "LAND", nil, 1, "Logical AND (TOS & TOS-1)", nil, nil, false, 0), nil
	case opcode == DIF:
		return NewDecodedInstruction(opcode, "DIF", nil, 1, "Set difference (TOS-1 AND NOT TOS)", nil, nil, false, 0), nil
	case opcode == DVI:
		return NewDecodedInstruction(opcode, "DVI", nil, 1, "Divide integers (TOS-1 / TOS)", nil, nil, false, 0), nil
	case opcode == DVR:
		return NewDecodedInstruction(opcode, "DVR", nil, 1, "Divide reals (TOS-1 / TOS)", nil, nil, false, 0), nil
	case opcode == CHK:
		return NewDecodedInstruction(opcode, "CHK", nil, 1, "Check subrange (TOS-1 <= TOS-2 <= TOS)", nil, nil, false, 0), nil
	case opcode == FLO:
		return NewDecodedInstruction(opcode, "FLO", nil, 1, "Float next to TOS (int TOS-1 to real TOS)", nil, nil, false, 0), nil
	case opcode == FLT:
		return NewDecodedInstruction(opcode, "FLT", nil, 1, "Float TOS (int TOS to real TOS)", nil, nil, false, 0), nil
	case opcode == INN:
		return NewDecodedInstruction(opcode, "INN", nil, 1, "Set membership (TOS-1 in set TOS)", nil, nil, false, 0), nil
	case opcode == INT:
		return NewDecodedInstruction(opcode, "INT", nil, 1, "Set intersection (TOS AND TOS-1)", nil, nil, false, 0), nil
	case opcode == LOR:
		return NewDecodedInstruction(opcode, "LOR", nil, 1, "Logical OR (TOS | TOS-1)", nil, nil, false, 0), nil
	case opcode == MODI:
		return NewDecodedInstruction(opcode, "MODI", nil, 1, "Modulo integers (TOS-1 % TOS)", nil, nil, false, 0), nil
	case opcode == MPI:
		return NewDecodedInstruction(opcode, "MPI", nil, 1, "Multiply integers (TOS * TOS-1)", nil, nil, false, 0), nil
	case opcode == MPR:
		return NewDecodedInstruction(opcode, "MPR", nil, 1, "Multiply reals (TOS * TOS-1)", nil, nil, false, 0), nil
	case opcode == NGI:
		return NewDecodedInstruction(opcode, "NGI", nil, 1, "Negate integer", nil, nil, false, 0), nil
	case opcode == NGR:
		return NewDecodedInstruction(opcode, "NGR", nil, 1, "Negate real", nil, nil, false, 0), nil
	case opcode == LNOT:
		return NewDecodedInstruction(opcode, "LNOT", nil, 1, "Logical NOT (~TOS)", nil, nil, false, 0), nil
	case opcode == SRS:
		return NewDecodedInstruction(opcode, "SRS", nil, 1, "Subrange set [TOS-1..TOS]", nil, nil, false, 0), nil
	case opcode == SBI:
		return NewDecodedInstruction(opcode, "SBI", nil, 1, "Subtract integers (TOS-1 - TOS)", nil, nil, false, 0), nil
	case opcode == SBR:
		return NewDecodedInstruction(opcode, "SBR", nil, 1, "Subtract reals (TOS-1 - TOS)", nil, nil, false, 0), nil
	case opcode == SGS:
		return NewDecodedInstruction(opcode, "SGS", nil, 1, "Build singleton set [TOS]", nil, nil, false, 0), nil
	case opcode == SQI:
		return NewDecodedInstruction(opcode, "SQI", nil, 1, "Square integer (TOS * TOS)", nil, nil, false, 0), nil
	case opcode == SQR:
		return NewDecodedInstruction(opcode, "SQR", nil, 1, "Square real (TOS * TOS)", nil, nil, false, 0), nil
	case opcode == STO:
		return NewDecodedInstruction(opcode, "STO", nil, 1, "Store indirect word (TOS into TOS-1)", nil, nil, false, 0), nil
	case opcode == IXS:
		return NewDecodedInstruction(opcode, "IXS", nil, 1, "Index string array (check 1<=TOS<=len of str TOS-1)", nil, nil, false, 0), nil
	case opcode == UNI:
		return NewDecodedInstruction(opcode, "UNI", nil, 1, "Set union (TOS OR TOS-1)", nil, nil, false, 0), nil

	case opcode == LDE:
		seg, err := od.CD.ReadByteAt(ic + 1)
		if err != nil {
			return nil, err
		}
		val, inc, err := od.CD.ReadBigAt(ic + 2)
		if err != nil {
			return nil, err
		}
		return NewDecodedInstruction(opcode, "LDE", []int{int(seg), val}, 2+inc,
			fmt.Sprintf("Load extended word (word offset %d in data seg %d)", val, seg), nil, nil, false, 0), nil

	case opcode == CSP:
		procNum, err := od.CD.ReadByteAt(ic + 1)
		if err != nil {
			return nil, err
		}
		procName := ""
		if csp, ok := CSPProcs[int(procNum)]; ok {
			procName = csp.Name
		} else {
			procName = fmt.Sprintf("%d", procNum)
		}
		return NewDecodedInstruction(opcode, "CSP", []int{int(procNum)}, 2,
			fmt.Sprintf("Call standard procedure %s", procName), nil, nil, false, 0), nil

	case opcode == LDCN:
		return NewDecodedInstruction(opcode, "LDCN", nil, 1, "Load constant NIL", nil, nil, false, 0), nil

	case opcode == ADJ:
		count, err := od.CD.ReadByteAt(ic + 1)
		if err != nil {
			return nil, err
		}
		return NewDecodedInstruction(opcode, "ADJ", []int{int(count)}, 2,
			fmt.Sprintf("Adjust set to %d words", count), nil, nil, false, 0), nil

	case opcode == FJP:
		offset, err := od.CD.ReadByteAt(ic + 1)
		if err != nil {
			return nil, err
		}
		dest := 0
		if offset > 0x7f {
			jte := addr + int(offset) - 256
			jumpTableEntry, err := od.CD.ReadWordAt(jte)
			if err != nil {
				return nil, err
			}
			dest = jte - int(jumpTableEntry)
		} else {
			dest = ic + int(offset) + 2
		}
		return NewDecodedInstruction(opcode, "FJP", []int{dest}, 2,
			fmt.Sprintf("Jump if TOS false to %04x", dest), nil, nil, false, 0), nil

	case opcode == INC:
		val, inc, err := od.CD.ReadBigAt(ic + 1)
		if err != nil {
			return nil, err
		}
		return NewDecodedInstruction(opcode, "INC", []int{val}, 1+inc,
			fmt.Sprintf("Inc field ptr (TOS+%d)", val), nil, nil, false, 0), nil

	case opcode == IND:
		val, inc, err := od.CD.ReadBigAt(ic + 1)
		if err != nil {
			return nil, err
		}
		return NewDecodedInstruction(opcode, "IND", []int{val}, 1+inc,
			fmt.Sprintf("Static index and load word (TOS+%d)", val), nil, nil, false, 0), nil

	case opcode == IXA:
		val, inc, err := od.CD.ReadBigAt(ic + 1)
		if err != nil {
			return nil, err
		}
		return NewDecodedInstruction(opcode, "IXA", []int{val}, 1+inc,
			fmt.Sprintf("Index array (TOS-1 + TOS * %d)", val), nil, nil, false, 0), nil

	case opcode == LAO:
		val, inc, err := od.CD.ReadBigAt(ic + 1)
		if err != nil {
			return nil, err
		}
		loc := findLoc(1, 1, 0, val, true, false, true)
		return NewDecodedInstruction(opcode, "LAO", []int{val}, 1+inc,
			"Load global address", loc, nil, false, 0), nil

	case opcode == LSA:
		strLen, err := od.CD.ReadByteAt(ic + 1)
		if err != nil {
			return nil, err
		}
		s := ""
		for i := 0; i < int(strLen); i++ {
			ch, err := od.CD.ReadByteAt(ic + 2 + i)
			if err != nil {
				return nil, err
			}
			s += string(ch)
		}
		return NewDecodedInstruction(opcode, "LSA", []int{int(strLen)}, 2+int(strLen),
			fmt.Sprintf("Load string address: '%s'", s), nil, nil, false, 0), nil

	case opcode == LAE:
		seg, err := od.CD.ReadByteAt(ic + 1)
		if err != nil {
			return nil, err
		}
		val, inc, err := od.CD.ReadBigAt(ic + 2)
		if err != nil {
			return nil, err
		}
		loc := findLoc(int(seg), 0, 0, val, true, true, true)
		return NewDecodedInstruction(opcode, "LAE", []int{int(seg), val}, 2+inc,
			"Load extended address", loc, nil, false, 0), nil

	case opcode == MOV:
		val, inc, err := od.CD.ReadBigAt(ic + 1)
		if err != nil {
			return nil, err
		}
		return NewDecodedInstruction(opcode, "MOV", []int{val}, 1+inc,
			fmt.Sprintf("Move %d words (TOS to TOS-1)", val), nil, nil, false, 0), nil

	case opcode == LDO:
		val, inc, err := od.CD.ReadBigAt(ic + 1)
		if err != nil {
			return nil, err
		}
		loc := findLoc(1, 1, 0, val, true, false, true)
		return NewDecodedInstruction(opcode, "LDO", []int{val}, 1+inc,
			"Load global word", loc, nil, false, 0), nil

	case opcode == SAS:
		sasCount, err := od.CD.ReadByteAt(ic + 1)
		if err != nil {
			return nil, err
		}
		return NewDecodedInstruction(opcode, "SAS", []int{int(sasCount)}, 2,
			fmt.Sprintf("String assign (TOS to TOS-1, %d chars)", sasCount), nil, nil, false, 0), nil

	case opcode == SRO:
		val, inc, err := od.CD.ReadBigAt(ic + 1)
		if err != nil {
			return nil, err
		}
		loc := findLoc(1, 1, 0, val, true, false, true)
		return NewDecodedInstruction(opcode, "SRO", []int{val}, 1+inc,
			"Store global word", loc, nil, false, 0), nil

	case opcode == XJP:
		return NewDecodedInstruction(opcode, "XJP", nil, 0, "Case jump", nil, nil, false, 0), nil

	case opcode == RNP:
		retCount, err := od.CD.ReadByteAt(ic + 1)
		if err != nil {
			return nil, err
		}
		return NewDecodedInstruction(opcode, "RNP", []int{int(retCount)}, 2,
			"Return from nonbase procedure", nil, nil, false, 0), nil

	case opcode == CIP:
		procNum, err := od.CD.ReadByteAt(ic + 1)
		if err != nil {
			return nil, err
		}
		loc := findLoc(currSeg.SegNum, int(procNum), 0, 0, true, false, false)
		return NewDecodedInstruction(opcode, "CIP", []int{int(procNum)}, 2,
			"Call intermediate procedure", nil, loc, false, 0), nil

	case opcode == EQL:
		return NewDecodedInstruction(opcode, "EQL", nil, 0, "", nil, nil, true, ic+1), nil
	case opcode == GEQ:
		return NewDecodedInstruction(opcode, "GEQ", nil, 0, "", nil, nil, true, ic+1), nil
	case opcode == GRT:
		return NewDecodedInstruction(opcode, "GRT", nil, 0, "", nil, nil, true, ic+1), nil

	case opcode == LDA:
		byte1, err := od.CD.ReadByteAt(ic + 1)
		if err != nil {
			return nil, err
		}
		val, inc, err := od.CD.ReadBigAt(ic + 2)
		if err != nil {
			return nil, err
		}
		refLexLevel := proc.LexicalLevel - int(byte1)
		seg := currSeg.SegNum
		if refLexLevel < 0 {
			seg = 0
		}
		loc := findLoc(seg, 0, refLexLevel, val, false, true, true)
		return NewDecodedInstruction(opcode, "LDA", []int{int(byte1), val}, 2+inc,
			"Load intermediate address", loc, nil, false, 0), nil

	case opcode == LDC:
		count, err := od.CD.ReadByteAt(ic + 1)
		if err != nil {
			return nil, err
		}
		return NewDecodedInstruction(opcode, "LDC", []int{int(count)}, 0,
			"Load multiple-word constant", nil, nil, false, 0), nil

	case opcode == LEQ:
		return NewDecodedInstruction(opcode, "LEQ", nil, 0, "", nil, nil, true, ic+1), nil
	case opcode == LES:
		return NewDecodedInstruction(opcode, "LES", nil, 0, "", nil, nil, true, ic+1), nil

	case opcode == LOD:
		byte1, err := od.CD.ReadByteAt(ic + 1)
		if err != nil {
			return nil, err
		}
		val, inc, err := od.CD.ReadBigAt(ic + 2)
		if err != nil {
			return nil, err
		}
		refLexLevel := proc.LexicalLevel - int(byte1)
		seg := currSeg.SegNum
		if refLexLevel < 0 {
			seg = 0
		}
		loc := findLoc(seg, 0, refLexLevel, val, false, true, true)
		return NewDecodedInstruction(opcode, "LOD", []int{int(byte1), val}, 2+inc,
			"Load intermediate word", loc, nil, false, 0), nil

	case opcode == NEQ:
		return NewDecodedInstruction(opcode, "NEQ", nil, 0, "", nil, nil, true, ic+1), nil

	case opcode == STR:
		byte1, err := od.CD.ReadByteAt(ic + 1)
		if err != nil {
			return nil, err
		}
		val, inc, err := od.CD.ReadBigAt(ic + 2)
		if err != nil {
			return nil, err
		}
		refLexLevel := proc.LexicalLevel - int(byte1)
		seg := currSeg.SegNum
		if refLexLevel < 0 {
			seg = 0
		}
		loc := findLoc(seg, 0, refLexLevel, val, false, true, true)
		return NewDecodedInstruction(opcode, "STR", []int{int(byte1), val}, 2+inc,
			"Store intermediate word", loc, nil, false, 0), nil

	case opcode == UJP:
		offset, err := od.CD.ReadByteAt(ic + 1)
		if err != nil {
			return nil, err
		}
		dest := 0
		if offset > 0x7f {
			jte := addr + int(offset) - 256
			jumpTableEntry, err := od.CD.ReadWordAt(jte)
			if err != nil {
				return nil, err
			}
			dest = jte - int(jumpTableEntry)
		} else {
			dest = ic + int(offset) + 2
		}
		return NewDecodedInstruction(opcode, "UJP", []int{dest}, 2,
			fmt.Sprintf("Unconditional jump to %04x", dest), nil, nil, false, 0), nil

	case opcode == LDP:
		return NewDecodedInstruction(opcode, "LDP", nil, 1, "Load packed field (TOS)", nil, nil, false, 0), nil
	case opcode == STP:
		return NewDecodedInstruction(opcode, "STP", nil, 1, "Store packed field (TOS into TOS-1)", nil, nil, false, 0), nil

	case opcode == LDM:
		ldmCount, err := od.CD.ReadByteAt(ic + 1)
		if err != nil {
			return nil, err
		}
		return NewDecodedInstruction(opcode, "LDM", []int{int(ldmCount)}, 2,
			fmt.Sprintf("Load %d words from (TOS)", ldmCount), nil, nil, false, 0), nil

	case opcode == STM:
		stmCount, err := od.CD.ReadByteAt(ic + 1)
		if err != nil {
			return nil, err
		}
		return NewDecodedInstruction(opcode, "STM", []int{int(stmCount)}, 2,
			fmt.Sprintf("Store %d words at TOS to TOS-1", stmCount), nil, nil, false, 0), nil

	case opcode == LDB:
		return NewDecodedInstruction(opcode, "LDB", nil, 1, "Load byte at byte ptr TOS-1 + TOS", nil, nil, false, 0), nil
	case opcode == STB:
		return NewDecodedInstruction(opcode, "STB", nil, 1, "Store byte at TOS to byte ptr TOS-2 + TOS-1", nil, nil, false, 0), nil

	case opcode == IXP:
		elementsPerWord, err := od.CD.ReadByteAt(ic + 1)
		if err != nil {
			return nil, err
		}
		fieldWidth, err := od.CD.ReadByteAt(ic + 2)
		if err != nil {
			return nil, err
		}
		return NewDecodedInstruction(opcode, "IXP", []int{int(elementsPerWord), int(fieldWidth)}, 3,
			fmt.Sprintf("Index packed array TOS-1[TOS], %d elts/word, %d field width", elementsPerWord, fieldWidth), nil, nil, false, 0), nil

	case opcode == RBP:
		retCount, err := od.CD.ReadByteAt(ic + 1)
		if err != nil {
			return nil, err
		}
		return NewDecodedInstruction(opcode, "RBP", []int{int(retCount)}, 2,
			"Return from base procedure", nil, nil, false, 0), nil

	case opcode == CBP:
		procNum, err := od.CD.ReadByteAt(ic + 1)
		if err != nil {
			return nil, err
		}
		loc := findLoc(currSeg.SegNum, int(procNum), 0, 0, true, false, false)
		return NewDecodedInstruction(opcode, "CBP", []int{int(procNum)}, 2,
			"Call base procedure", nil, loc, false, 0), nil

	case opcode == EQUI:
		return NewDecodedInstruction(opcode, "EQUI", nil, 1, "Integer TOS-1 = TOS", nil, nil, false, 0), nil
	case opcode == GEQI:
		return NewDecodedInstruction(opcode, "GEQI", nil, 1, "Integer TOS-1 >= TOS", nil, nil, false, 0), nil
	case opcode == GRTI:
		return NewDecodedInstruction(opcode, "GRTI", nil, 1, "Integer TOS-1 > TOS", nil, nil, false, 0), nil

	case opcode == LLA:
		val, inc, err := od.CD.ReadBigAt(ic + 1)
		if err != nil {
			return nil, err
		}
		loc := findLoc(currSeg.SegNum, procedure, proc.LexicalLevel, val, true, true, true)
		return NewDecodedInstruction(opcode, "LLA", []int{val}, 1+inc,
			"Load local address", loc, nil, false, 0), nil

	case opcode == LDCI:
		val, err := od.CD.ReadWordAt(ic + 1)
		if err != nil {
			return nil, err
		}
		return NewDecodedInstruction(opcode, "LDCI", []int{int(val)}, 3,
			fmt.Sprintf("Load one-word constant %d", val), nil, nil, false, 0), nil

	case opcode == LEQI:
		return NewDecodedInstruction(opcode, "LEQI", nil, 1, "Integer TOS-1 <= TOS", nil, nil, false, 0), nil
	case opcode == LESI:
		return NewDecodedInstruction(opcode, "LESI", nil, 1, "Integer TOS-1 < TOS", nil, nil, false, 0), nil

	case opcode == LDL:
		val, inc, err := od.CD.ReadBigAt(ic + 1)
		if err != nil {
			return nil, err
		}
		loc := findLoc(segment, procedure, proc.LexicalLevel, val, true, true, true)
		return NewDecodedInstruction(opcode, "LDL", []int{val}, 1+inc,
			"Load local word", loc, nil, false, 0), nil

	case opcode == NEQI:
		return NewDecodedInstruction(opcode, "NEQI", nil, 1, "Integer TOS-1 <> TOS", nil, nil, false, 0), nil

	case opcode == STL:
		val, inc, err := od.CD.ReadBigAt(ic + 1)
		if err != nil {
			return nil, err
		}
		loc := findLoc(segment, procedure, proc.LexicalLevel, val, true, true, true)
		return NewDecodedInstruction(opcode, "STL", []int{val}, 1+inc,
			"Store local word", loc, nil, false, 0), nil

	case opcode == CXP:
		seg, err := od.CD.ReadByteAt(ic + 1)
		if err != nil {
			return nil, err
		}
		procNum, err := od.CD.ReadByteAt(ic + 2)
		if err != nil {
			return nil, err
		}
		loc := findLoc(int(seg), int(procNum), 0, 0, true, false, false)
		return NewDecodedInstruction(opcode, "CXP", []int{int(seg), int(procNum)}, 3,
			"Call external procedure", nil, loc, false, 0), nil

	case opcode == CLP:
		procNum, err := od.CD.ReadByteAt(ic + 1)
		if err != nil {
			return nil, err
		}
		loc := findLoc(currSeg.SegNum, int(procNum), 0, 0, true, false, false)
		return NewDecodedInstruction(opcode, "CLP", []int{int(procNum)}, 2,
			"Call local procedure", nil, loc, false, 0), nil

	case opcode == CGP:
		procNum, err := od.CD.ReadByteAt(ic + 1)
		if err != nil {
			return nil, err
		}
		loc := findLoc(currSeg.SegNum, int(procNum), 0, 0, true, false, false)
		return NewDecodedInstruction(opcode, "CGP", []int{int(procNum)}, 2,
			"Call global procedure", nil, loc, false, 0), nil

	case opcode == LPA:
		count, err := od.CD.ReadByteAt(ic + 1)
		if err != nil {
			return nil, err
		}
		return NewDecodedInstruction(opcode, "LPA", []int{int(count)}, 2+int(count),
			"Load packed array", nil, nil, false, 0), nil

	case opcode == STE:
		seg, err := od.CD.ReadByteAt(ic + 1)
		if err != nil {
			return nil, err
		}
		val, inc, err := od.CD.ReadBigAt(ic + 2)
		if err != nil {
			return nil, err
		}
		loc := findLoc(int(seg), 0, 0, val, true, true, true)
		return NewDecodedInstruction(opcode, "STE", []int{int(seg), val}, 2+inc,
			"Store extended word TOS into", loc, nil, false, 0), nil

	case opcode == NOP:
		return NewDecodedInstruction(opcode, "NOP", nil, 1, "No operation", nil, nil, false, 0), nil

	case opcode == BPT:
		val, inc, err := od.CD.ReadBigAt(ic + 1)
		if err != nil {
			return nil, err
		}
		return NewDecodedInstruction(opcode, "BPT", []int{val}, 1+inc, "Breakpoint", nil, nil, false, 0), nil

	case opcode == XIT:
		return NewDecodedInstruction(opcode, "XIT", nil, 1, "Exit the operating system", nil, nil, false, 0), nil
	case opcode == NOP2:
		return NewDecodedInstruction(opcode, "NOP", nil, 1, "No operation", nil, nil, false, 0), nil

	case opcode >= SLDL1 && opcode <= SLDL16:
		val := int(opcode) - int(SLDL1) + 1
		loc := findLoc(segment, procedure, proc.LexicalLevel, val, true, true, true)
		return NewDecodedInstruction(opcode, "SLDL", []int{val}, 1,
			"Short load local word", loc, nil, false, 0), nil

	case opcode >= SLDO1 && opcode <= SLDO16:
		val := int(opcode) - int(SLDO1) + 1
		loc := findLoc(1, 1, 0, val, true, true, true)
		return NewDecodedInstruction(opcode, "SLDO", []int{val}, 1,
			"Short load global word", loc, nil, false, 0), nil

	case opcode >= SIND0:
		offs := int(opcode) - int(SIND0)
		return NewDecodedInstruction(opcode, "SIND", []int{offs}, 1,
			fmt.Sprintf("Short index and load word *TOS+%d", offs), nil, nil, false, 0), nil

	default:
		return nil, &types.CodeDataError{Message: fmt.Sprintf("unknown opcode: 0x%02x", opcode)}
	}
}

type ComparatorInfo struct {
	Suffix   string
	Prefix   string
	DataType string
	Inc      int
}

func (od *OpcodeDecoder) DecodeComparator(index int) ComparatorInfo {
	b, err := od.CD.ReadByteAt(index)
	if err != nil {
		return ComparatorInfo{"", "", "", 1}
	}

	switch b {
	case 2:
		return ComparatorInfo{"REAL", "Real", "REAL", 1}
	case 4:
		return ComparatorInfo{"STR", "String", "STRING", 1}
	case 6:
		return ComparatorInfo{"BOOL", "Boolean", "BOOLEAN", 1}
	case 8:
		return ComparatorInfo{"SET", "Set", "SET", 1}
	case 10:
		val, inc, err := od.CD.ReadBigAt(index + 1)
		if err != nil {
			return ComparatorInfo{"BYTE", "Byte array (0 long)", "ARRAY OF BYTE", 1}
		}
		return ComparatorInfo{
			"BYTE",
			fmt.Sprintf("Byte array (%d long)", val),
			fmt.Sprintf("ARRAY[1..%d] OF BYTE", val),
			inc + 1,
		}
	case 12:
		val, inc, err := od.CD.ReadBigAt(index + 1)
		if err != nil {
			return ComparatorInfo{"WORD", "Word array (0 long)", "ARRAY OF WORD", 1}
		}
		return ComparatorInfo{
			"WORD",
			fmt.Sprintf("Word array (%d long)", val),
			fmt.Sprintf("ARRAY[1..%d] OF WORD", val),
			inc + 1,
		}
	default:
		return ComparatorInfo{"", "", "", 1}
	}
}
