package simulator

import "fmt"

type SimInsn struct {
	IC       int
	Mnemonic string
	Args     []int
}

type SimulatorError struct {
	Message string
}

func (e *SimulatorError) Error() string {
	return e.Message
}

type Frame struct {
	ID   int
	Base int
}

type Machine struct {
	Stack       []int
	Memory      map[int]int
	PC          int
	Trace       []TraceEntry
	Frames      []Frame
	NextFrameID int
	MP          *int
}

type TraceEntry struct {
	IC       int
	Mnemonic string
}

func NewMachine() *Machine {
	return &Machine{
		Stack:       []int{},
		Memory:      make(map[int]int),
		PC:          0,
		Trace:       []TraceEntry{},
		Frames:      []Frame{},
		NextFrameID: 1,
		MP:          nil,
	}
}

func (m *Machine) Reset() {
	m.Stack = []int{}
	m.Memory = make(map[int]int)
	m.PC = 0
	m.Trace = []TraceEntry{}
	m.Frames = []Frame{}
	m.NextFrameID = 1
	m.MP = nil
}

func (m *Machine) FlatKey(encoded int) int {
	// Interpret as three-field encoding [segment:8][procOrLex:8][addr:16]
	if encoded&0xffff0000 != 0 {
		seg8 := (encoded >> 24) & 0xff
		p8 := (encoded >> 16) & 0xff
		a := encoded & 0xffff
		isLex := (p8 & 0x80) != 0
		pVal := p8 & 0x7f

		if isLex {
			// Resolve lexical address relative to current frame base
			if len(m.Frames) > 0 {
				top := m.Frames[len(m.Frames)-1]
				base := top.Base
				resolved := base + a
				return (seg8 << 24) | (resolved & 0xffff)
			}
			// No frame: fall back to proc-relative encoding
			return (seg8 << 24) | (pVal << 16) | a
		}
		return (seg8 << 24) | (pVal << 16) | a
	}
	return encoded
}

func (m *Machine) EnterFrame(base int) int {
	id := m.NextFrameID
	m.NextFrameID++
	useBase := base
	if useBase == 0 {
		// Allocate default frame base
		useBase = id * 0x1000
	}
	m.Frames = append(m.Frames, Frame{ID: id, Base: useBase})
	m.MP = &useBase
	return id
}

func (m *Machine) PopFrame() *int {
	if len(m.Frames) == 0 {
		return nil
	}
	f := m.Frames[len(m.Frames)-1]
	m.Frames = m.Frames[:len(m.Frames)-1]

	// Restore MP to previous frame base or nil
	if len(m.Frames) > 0 {
		prev := m.Frames[len(m.Frames)-1]
		m.MP = &prev.Base
	} else {
		m.MP = nil
	}
	id := f.ID
	return &id
}

func (m *Machine) PopReturnIP() *int {
	if len(m.Stack) == 0 {
		return nil
	}
	val := m.Stack[len(m.Stack)-1]
	m.Stack = m.Stack[:len(m.Stack)-1]
	return &val
}

func (m *Machine) CurrentTrace() []TraceEntry {
	return m.Trace
}

func (m *Machine) CurrentMemory() map[int]int {
	return m.Memory
}

func (m *Machine) Push(val int) {
	m.Stack = append(m.Stack, val)
}

func (m *Machine) Pop() (int, error) {
	if len(m.Stack) == 0 {
		return 0, &SimulatorError{"stack underflow"}
	}
	val := m.Stack[len(m.Stack)-1]
	m.Stack = m.Stack[:len(m.Stack)-1]
	return val, nil
}

func (m *Machine) Peek() (int, error) {
	if len(m.Stack) == 0 {
		return 0, &SimulatorError{"stack underflow"}
	}
	return m.Stack[len(m.Stack)-1], nil
}

type ExecutionResult struct {
	Stack  []int
	Trace  []TraceEntry
	Memory map[int]int
	Halted bool
}

func (m *Machine) Execute(instructions []SimInsn, entryIC int, maxSteps int) (*ExecutionResult, error) {
	m.Reset()
	m.PC = entryIC

	// Build instruction map
	insMap := make(map[int]*SimInsn)
	var sortedICs []int
	for i := range instructions {
		insMap[instructions[i].IC] = &instructions[i]
		sortedICs = append(sortedICs, instructions[i].IC)
	}

	// Sort ICs
	for i := 0; i < len(sortedICs); i++ {
		for j := i + 1; j < len(sortedICs); j++ {
			if sortedICs[i] > sortedICs[j] {
				sortedICs[i], sortedICs[j] = sortedICs[j], sortedICs[i]
			}
		}
	}

	steps := 0
	halted := false

	for steps < maxSteps {
		steps++
		ins, ok := insMap[m.PC]
		if !ok {
			halted = true
			break
		}

		m.Trace = append(m.Trace, TraceEntry{IC: m.PC, Mnemonic: ins.Mnemonic})

		// Find next PC
		nextPC := m.PC + 1
		for i, ic := range sortedICs {
			if ic == m.PC && i+1 < len(sortedICs) {
				nextPC = sortedICs[i+1]
				break
			}
		}

		// Execute instruction (simplified)
		err := m.executeInstruction(ins, &nextPC)
		if err != nil {
			return nil, err
		}

		if nextPC == -1 {
			halted = true
			break
		}

		m.PC = nextPC
	}

	if steps >= maxSteps {
		return nil, &SimulatorError{fmt.Sprintf("max steps exceeded: %d", maxSteps)}
	}

	return &ExecutionResult{
		Stack:  m.Stack,
		Trace:  m.Trace,
		Memory: m.Memory,
		Halted: halted,
	}, nil
}

func (m *Machine) executeInstruction(ins *SimInsn, nextPC *int) error {
	mnem := ins.Mnemonic

	switch mnem {
	case "SLDC", "LDC", "LDCI", "LDCN":
		if len(ins.Args) > 0 {
			m.Push(ins.Args[0])
		} else {
			m.Push(0)
		}

	case "LDA", "LLA":
		addr := 0
		if len(ins.Args) > 0 {
			addr = ins.Args[0]
		}
		addr = m.FlatKey(addr)
		m.Push(addr)

	case "LDL":
		addr := 0
		if len(ins.Args) > 0 {
			addr = ins.Args[0]
		}
		addr = m.FlatKey(addr)
		val := m.Memory[addr]
		m.Push(val)

	case "STL":
		addr := 0
		if len(ins.Args) > 0 {
			addr = ins.Args[0]
		}
		addr = m.FlatKey(addr)
		val, err := m.Pop()
		if err != nil {
			return err
		}
		m.Memory[addr] = val

	case "ADI":
		b, _ := m.Pop()
		a, _ := m.Pop()
		m.Push(a + b)

	case "SBI":
		b, _ := m.Pop()
		a, _ := m.Pop()
		m.Push(a - b)

	case "MPI":
		b, _ := m.Pop()
		a, _ := m.Pop()
		m.Push(a * b)

	case "DVI":
		b, _ := m.Pop()
		a, _ := m.Pop()
		if b != 0 {
			m.Push(a / b)
		} else {
			m.Push(0)
		}

	case "MODI":
		b, _ := m.Pop()
		a, _ := m.Pop()
		if b != 0 {
			m.Push(a % b)
		} else {
			m.Push(0)
		}

	case "NGI":
		a, _ := m.Pop()
		m.Push(-a)

	case "UJP":
		if len(ins.Args) > 0 {
			*nextPC = ins.Args[0]
		}

	case "FJP":
		cond, _ := m.Pop()
		if cond == 0 && len(ins.Args) > 0 {
			*nextPC = ins.Args[0]
		}

	case "EQUI", "EQL":
		b, _ := m.Pop()
		a, _ := m.Pop()
		if a == b {
			m.Push(1)
		} else {
			m.Push(0)
		}

	case "NEQI", "NEQ":
		b, _ := m.Pop()
		a, _ := m.Pop()
		if a != b {
			m.Push(1)
		} else {
			m.Push(0)
		}

	case "LESI", "LES":
		b, _ := m.Pop()
		a, _ := m.Pop()
		if a < b {
			m.Push(1)
		} else {
			m.Push(0)
		}

	case "LEQI", "LEQ":
		b, _ := m.Pop()
		a, _ := m.Pop()
		if a <= b {
			m.Push(1)
		} else {
			m.Push(0)
		}

	case "GRTI", "GRT":
		b, _ := m.Pop()
		a, _ := m.Pop()
		if a > b {
			m.Push(1)
		} else {
			m.Push(0)
		}

	case "GEQI", "GEQ":
		b, _ := m.Pop()
		a, _ := m.Pop()
		if a >= b {
			m.Push(1)
		} else {
			m.Push(0)
		}

	case "IND":
		// Indirect load with offset
		offset := 0
		if len(ins.Args) > 0 {
			offset = ins.Args[0]
		}
		addr, _ := m.Pop()
		val := m.Memory[addr+offset]
		m.Push(val)

	case "INC":
		// Increment address
		offset := 0
		if len(ins.Args) > 0 {
			offset = ins.Args[0]
		}
		addr, _ := m.Pop()
		m.Push(addr + offset)

	case "STO":
		// Store indirect
		val, _ := m.Pop()
		addr, _ := m.Pop()
		m.Memory[addr] = val

	case "XIT", "RNP", "RBP":
		// Exit/return
		*nextPC = -1

	case "NOP":
		// No operation

	default:
		// Unknown opcode - just continue
	}

	return nil
}
