package codegen

import (
	"fmt"
	"strconv"
	"strings"

	"pdisasm-go/internal/decoder"
	"pdisasm-go/internal/procedure"
	"pdisasm-go/internal/simulator"
	"pdisasm-go/internal/types"
)

type PseudoCodeGenerator struct {
	ProcLookup  map[string]*procedure.ProcIdentifier
	LabelLookup map[string]*types.Location
}

func NewPseudoCodeGenerator(
	procLookup map[string]*procedure.ProcIdentifier,
	labelLookup map[string]*types.Location,
) *PseudoCodeGenerator {
	return &PseudoCodeGenerator{
		ProcLookup:  procLookup,
		LabelLookup: labelLookup,
	}
}

func (pcg *PseudoCodeGenerator) FindLabel(loc *types.Location) (string, string) {
	key := loc.Key()
	if ll, ok := pcg.LabelLookup[key]; ok {
		return ll.Name, ll.Type
	} // NOTE TO ME: HOW DO WE DISTINGUISH Lexlevel if it's needed or not??
	return "", ""
}

func (pcg *PseudoCodeGenerator) GenerateForInstruction(inst *decoder.DecodedInstruction, stack *simulator.StackSimulator) string {
	switch inst.Mnemonic {
	case "STO", "SAS":
		src, _ := stack.PopUntyped(false)
		dest, _ := stack.PopUntyped(false)
		return fmt.Sprintf("%s := %s", dest, src)

	case "MOV":
		src, _ := stack.PopUntyped(false)
		dst, _ := stack.PopUntyped(false)
		return fmt.Sprintf("%s := %s", dst, src)

	case "STP":
		a, _ := stack.PopUntyped(false)
		bbit, _ := stack.PopUntyped(false)
		bwid, _ := stack.PopUntyped(false)
		b, _ := stack.PopUntyped(false)
		return fmt.Sprintf("%s:%s:%s := %s", b, bwid, bbit, a)

	case "STB":
		src, _ := stack.PopUntyped(false)
		dstoffs, _ := stack.PopUntyped(false)
		dstaddr, _ := stack.PopUntyped(false)
		return fmt.Sprintf("%s[%s] := %s", dstaddr, dstoffs, src)

	case "SRO", "STR", "STL", "STE":
		src, srcType := stack.PopUntyped(false)
		if inst.MemLocation != nil {
			destName, destType := pcg.FindLabel(inst.MemLocation)
			if destName == "" {
				destName = inst.MemLocation.Name
			}

			// Special formatting for specific types
			if destType != "" {
				switch destType {
				case "CHAR":
					if ch, err := strconv.Atoi(src); err == nil && ch >= 0x20 && ch <= 0x7E {
						return fmt.Sprintf("%s := '%c'", destName, ch)
					}
				case "BOOLEAN":
					if src == "0" {
						return fmt.Sprintf("%s := FALSE", destName)
					} else if src == "1" {
						return fmt.Sprintf("%s := TRUE", destName)
					}
				}
			}

			// Type mismatch warning (silent in production)
			if destType != "" && srcType != "" && destType != srcType {
				_ = 0 // Type mismatch
			}

			return fmt.Sprintf("%s := %s", destName, src)
		}
		locName := "unknown"
		if inst.MemLocation != nil {
			locName = inst.MemLocation.Name
		}
		return fmt.Sprintf("%s := %s", locName, src)

	case "CIP", "CBP", "CXP", "CLP", "CGP":
		if inst.Destination != nil {
			return pcg.HandleCallProcedure(inst.Destination, stack)
		}
		return "missing destination!"

	default:
		return ""
	}
}

func (pcg *PseudoCodeGenerator) HandleCallProcedure(
	loc *types.Location,
	stack *simulator.StackSimulator,
) string {
	lookupKey := fmt.Sprintf("%d:%d", loc.Segment, *loc.Procedure)
	called, ok := pcg.ProcLookup[lookupKey]
	if !ok {
		return ""
	}

	parmCount := len(called.Parameters)
	var aParams []string

	// Pop function return space
	if called.IsFunction {
		stack.PopUntyped(false)
		stack.PopUntyped(false)
	}

	// Pop parameters
	for i := 0; i < parmCount; i++ {
		a, _ := stack.PopUntyped(false)
		paramType := called.Parameters[i].Type

		switch paramType {
		case "CHAR":
			if ch, err := strconv.Atoi(a); err == nil && ch >= 0x20 && ch <= 0x7E {
				aParams = append(aParams, fmt.Sprintf("'%c'", ch))
			} else {
				aParams = append(aParams, a)
			}
		case "BOOLEAN":
			if a == "0" {
				aParams = append(aParams, "FALSE")
			} else if a == "1" {
				aParams = append(aParams, "TRUE")
			} else {
				aParams = append(aParams, a)
			}
		default:
			aParams = append(aParams, a)
		}
	}

	// Reverse parameters (they were popped in reverse order)
	for i, j := 0, len(aParams)-1; i < j; i, j = i+1, j-1 {
		aParams[i], aParams[j] = aParams[j], aParams[i]
	}

	callSignature := fmt.Sprintf("%s(%s)", called.ShortDescription(), strings.Join(aParams, ", "))

	if called.IsFunction {
		retType := "UNKNOWN"
		if called.ReturnType != nil {
			retType = *called.ReturnType
		}
		stack.Push(callSignature, retType)
		return ""
	}

	return callSignature
}

// SimulateAndGenerate performs symbolic execution and generates pseudocode
func (pcg *PseudoCodeGenerator) SimulateAndGenerate(opcode uint8, decoded *decoder.DecodedInstruction, stack *simulator.StackSimulator) string {

	switch {
	// Constants
	case opcode <= decoder.SLDC127:
		if len(decoded.Params) > 0 {
			stack.Push(fmt.Sprintf("%d", decoded.Params[0]), "INTEGER")
		}

	case opcode == decoder.LDCI:
		if len(decoded.Params) > 0 {
			stack.Push(fmt.Sprintf("%d", decoded.Params[0]), "INTEGER")
		}

	case opcode == decoder.LDCN:
		stack.Push("NIL", "POINTER")

	// Arithmetic - Integer
	case opcode == decoder.ABI:
		a, _ := stack.Pop("INTEGER", false)
		stack.Push(fmt.Sprintf("ABS(%s)", a), "INTEGER")

	case opcode == decoder.ADI:
		a, _ := stack.Pop("INTEGER", false)
		b, _ := stack.Pop("INTEGER", false)
		stack.Push(fmt.Sprintf("%s + %s", b, a), "INTEGER")

	case opcode == decoder.SBI:
		a, _ := stack.Pop("INTEGER", false)
		b, _ := stack.Pop("INTEGER", false)
		stack.Push(fmt.Sprintf("%s - %s", b, a), "INTEGER")

	case opcode == decoder.MPI:
		a, _ := stack.Pop("INTEGER", false)
		b, _ := stack.Pop("INTEGER", false)
		stack.Push(fmt.Sprintf("%s * %s", b, a), "INTEGER")

	case opcode == decoder.DVI:
		a, _ := stack.Pop("INTEGER", false)
		b, _ := stack.Pop("INTEGER", false)
		stack.Push(fmt.Sprintf("%s DIV %s", b, a), "INTEGER")

	case opcode == decoder.MODI:
		a, _ := stack.Pop("INTEGER", false)
		b, _ := stack.Pop("INTEGER", false)
		stack.Push(fmt.Sprintf("%s MOD %s", b, a), "INTEGER")

	case opcode == decoder.NGI:
		a, _ := stack.Pop("INTEGER", false)
		stack.Push(fmt.Sprintf("-%s", a), "INTEGER")

	case opcode == decoder.SQI:
		a, _ := stack.Pop("INTEGER", false)
		stack.Push(fmt.Sprintf("SQR(%s)", a), "INTEGER")

	// Arithmetic - Real
	case opcode == decoder.ABR:
		a, _ := stack.PopReal()
		stack.PushReal(fmt.Sprintf("ABS(%s)", a))

	case opcode == decoder.ADR:
		a, _ := stack.PopReal()
		b, _ := stack.PopReal()
		stack.PushReal(fmt.Sprintf("%s + %s", b, a))

	case opcode == decoder.SBR:
		a, _ := stack.PopReal()
		b, _ := stack.PopReal()
		stack.PushReal(fmt.Sprintf("%s - %s", b, a))

	case opcode == decoder.MPR:
		a, _ := stack.PopReal()
		b, _ := stack.PopReal()
		stack.PushReal(fmt.Sprintf("%s * %s", b, a))

	case opcode == decoder.DVR:
		a, _ := stack.PopReal()
		b, _ := stack.PopReal()
		stack.PushReal(fmt.Sprintf("%s / %s", b, a))

	case opcode == decoder.NGR:
		a, _ := stack.PopReal()
		stack.PushReal(fmt.Sprintf("-%s", a))

	case opcode == decoder.SQR:
		a, _ := stack.PopReal()
		stack.PushReal(fmt.Sprintf("SQR(%s)", a))

	case opcode == decoder.FLT:
		a, _ := stack.Pop("INTEGER", false)
		stack.PushReal(a)

	case opcode == decoder.FLO:
		a, _ := stack.PopUntyped(false)
		b, _ := stack.Pop("INTEGER", false)
		stack.Push(a, "")
		stack.PushReal(b)

	// Logical
	case opcode == decoder.LAND:
		a, _ := stack.Pop("BOOLEAN", false)
		b, _ := stack.Pop("BOOLEAN", false)
		stack.Push(fmt.Sprintf("%s AND %s", b, a), "BOOLEAN")

	case opcode == decoder.LOR:
		a, _ := stack.Pop("BOOLEAN", false)
		b, _ := stack.Pop("BOOLEAN", false)
		stack.Push(fmt.Sprintf("%s OR %s", b, a), "BOOLEAN")

	case opcode == decoder.LNOT:
		a, _ := stack.Pop("BOOLEAN", false)
		stack.Push(fmt.Sprintf("NOT %s", a), "BOOLEAN")

	// Comparisons
	case opcode == decoder.EQUI, opcode == decoder.EQL:
		a, _ := stack.PopUntyped(false)
		b, _ := stack.PopUntyped(false)
		stack.Push(fmt.Sprintf("%s = %s", b, a), "BOOLEAN")

	case opcode == decoder.NEQI, opcode == decoder.NEQ:
		a, _ := stack.PopUntyped(false)
		b, _ := stack.PopUntyped(false)
		stack.Push(fmt.Sprintf("%s <> %s", b, a), "BOOLEAN")

	case opcode == decoder.LESI, opcode == decoder.LES:
		a, _ := stack.PopUntyped(false)
		b, _ := stack.PopUntyped(false)
		stack.Push(fmt.Sprintf("%s < %s", b, a), "BOOLEAN")

	case opcode == decoder.LEQI, opcode == decoder.LEQ:
		a, _ := stack.PopUntyped(false)
		b, _ := stack.PopUntyped(false)
		stack.Push(fmt.Sprintf("%s <= %s", b, a), "BOOLEAN")

	case opcode == decoder.GRTI, opcode == decoder.GRT:
		a, _ := stack.PopUntyped(false)
		b, _ := stack.PopUntyped(false)
		stack.Push(fmt.Sprintf("%s > %s", b, a), "BOOLEAN")

	case opcode == decoder.GEQI, opcode == decoder.GEQ:
		a, _ := stack.PopUntyped(false)
		b, _ := stack.PopUntyped(false)
		stack.Push(fmt.Sprintf("%s >= %s", b, a), "BOOLEAN")

	// Sets
	case opcode == decoder.SGS:
		a, _ := stack.Pop("INTEGER", false)
		stack.Push(fmt.Sprintf("[%s]", a), "SET")

	case opcode == decoder.SRS:
		a, _ := stack.Pop("INTEGER", false)
		b, _ := stack.Pop("INTEGER", false)
		stack.Push(fmt.Sprintf("[%s..%s]", b, a), "SET")

	case opcode == decoder.INN:
		_, set := stack.PopSet()
		chk, _ := stack.PopUntyped(false)
		stack.Push(fmt.Sprintf("%s IN %s", chk, set), "BOOLEAN")

	case opcode == decoder.UNI:
		set1Len, set1 := stack.PopSet()
		set2Len, set2 := stack.PopSet()
		maxLen := set1Len
		if set2Len > maxLen {
			maxLen = set2Len
		}
		for i := 0; i < maxLen; i++ {
			stack.Push(fmt.Sprintf("(%s OR %s){%d}", set2, set1, i), "SET")
		}
		stack.Push(fmt.Sprintf("%d", maxLen), "INTEGER")

	case opcode == decoder.INT:
		set1Len, set1 := stack.PopSet()
		set2Len, set2 := stack.PopSet()
		maxLen := set1Len
		if set2Len > maxLen {
			maxLen = set2Len
		}
		for i := 0; i < maxLen; i++ {
			stack.Push(fmt.Sprintf("(%s AND %s){%d}", set1, set2, i), "SET")
		}
		stack.Push(fmt.Sprintf("%d", maxLen), "INTEGER")

	case opcode == decoder.DIF:
		set1Len, set1 := stack.PopSet()
		set2Len, set2 := stack.PopSet()
		maxLen := set1Len
		if set2Len > maxLen {
			maxLen = set2Len
		}
		for i := 0; i < maxLen; i++ {
			stack.Push(fmt.Sprintf("(%s AND NOT %s){%d}", set2, set1, i), "SET")
		}
		stack.Push(fmt.Sprintf("%d", maxLen), "INTEGER")

	// Memory operations
	case opcode == decoder.LDL, opcode == decoder.LDO, opcode == decoder.LOD, opcode == decoder.LDE,
		opcode >= decoder.SLDO1 && opcode <= decoder.SLDO16,
		opcode >= decoder.SLDL1 && opcode <= decoder.SLDL16:
		if decoded.MemLocation != nil {
			name, typ := pcg.FindLabel(decoded.MemLocation)
			if name == "" {
				name = decoded.MemLocation.Name
			}
			stack.Push(name, typ)
		}

	case opcode == decoder.LLA, opcode == decoder.LAO, opcode == decoder.LDA, opcode == decoder.LAE:
		if decoded.MemLocation != nil {
			name, typ := pcg.FindLabel(decoded.MemLocation)
			if name == "" {
				name = decoded.MemLocation.Name
			}
			stack.Push(fmt.Sprintf("@%s", name), typ)
		}

	case opcode == decoder.IND:
		if len(decoded.Params) > 0 {
			offset := decoded.Params[0]
			addr, _ := stack.PopUntyped(false)
			if offset == 0 {
				stack.Push(fmt.Sprintf("*%s", addr), "")
			} else {
				stack.Push(fmt.Sprintf("*(%s+%d)", addr, offset), "")
			}
		}

	case opcode == decoder.INC:
		if len(decoded.Params) > 0 {
			offset := decoded.Params[0]
			addr, _ := stack.PopUntyped(false)
			stack.Push(fmt.Sprintf("%s+%d", addr, offset), "")
		}

	case opcode == decoder.IXA:
		if len(decoded.Params) > 0 {
			elemSize := decoded.Params[0]
			index, _ := stack.Pop("INTEGER", false)
			base, _ := stack.PopUntyped(false)
			stack.Push(fmt.Sprintf("%s[%s*%d]", base, index, elemSize), "")
		}

	case opcode == decoder.LSA:
		if len(decoded.Params) > 0 && decoded.Comment != "" {
			// Extract string from comment
			if idx := strings.Index(decoded.Comment, "'"); idx >= 0 {
				if endIdx := strings.LastIndex(decoded.Comment, "'"); endIdx > idx {
					str := decoded.Comment[idx : endIdx+1]
					stack.Push(str, "STRING")
				}
			}
		}

	// Control flow handled elsewhere
	case opcode == decoder.UJP, opcode == decoder.FJP, opcode == decoder.XJP:
		// These are handled in the main loop

	default:
		// Unknown opcode - no stack effect
	}

	return ""
}
