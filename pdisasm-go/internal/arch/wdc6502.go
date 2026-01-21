package arch

import (
	"fmt"

	"pdisasm-go/internal/procedure"
	"pdisasm-go/internal/types"
)

type WDC6502OpInfo struct {
	Mnemonic    string
	ParamLength int
}

var WDC6502 = map[uint8]WDC6502OpInfo{
	0x00: {"BRK", 0},
	0x01: {"ORA ($%02x,X)", 1},
	0x05: {"ORA $%02x", 1},
	0x06: {"ASL $%02x", 1},
	0x08: {"PHP", 0},
	0x09: {"ORA #$%02x", 1},
	0x0A: {"ASL A", 0},
	0x0d: {"ORA $%04x", 2},
	0x0e: {"ASL $%04x", 2},

	0x10: {"BPL $%02x", 1},
	0x11: {"ORA ($%02x),Y", 1},
	0x15: {"ORA $%02x,X", 1},
	0x16: {"ASL $%02x,X", 1},
	0x18: {"CLC", 0},
	0x19: {"ORA $%04x,Y", 2},
	0x1d: {"ORA $%04x,X", 2},
	0x1e: {"ASL $%04x,X", 2},

	0x20: {"JSR $%04x", 2},
	0x21: {"AND ($%02x,X)", 1},
	0x24: {"BIT $%02x", 1},
	0x25: {"AND $%02x", 1},
	0x26: {"ROL $%02x", 1},
	0x28: {"PLP", 0},
	0x29: {"AND #$%02x", 1},
	0x2a: {"ROL A", 0},
	0x2c: {"BIT $%04x", 2},
	0x2d: {"AND $%04x", 2},
	0x2e: {"ROL $%04x", 2},

	0x30: {"BMI $%02x", 1},
	0x31: {"AND ($%02x),Y", 1},
	0x35: {"AND $%02x,X", 1},
	0x36: {"ROL $%02x,X", 1},
	0x38: {"SEC", 0},
	0x39: {"AND $%04x,Y", 2},
	0x3d: {"AND $%04x,X", 2},
	0x3e: {"ROL $%04x,X", 2},

	0x40: {"RTI", 0},
	0x41: {"EOR ($%02x,X)", 1},
	0x45: {"EOR $%02x", 1},
	0x46: {"LSR $%02x", 1},
	0x48: {"PHA", 0},
	0x49: {"EOR #$%02x", 1},
	0x4a: {"LSR A", 0},
	0x4c: {"JMP $%04x", 2},
	0x4d: {"EOR $%04x", 2},
	0x4e: {"LSR $%04x", 2},

	0x50: {"BVC $%02x", 1},
	0x51: {"EOR ($%02x),Y", 1},
	0x55: {"EOR $%02x,X", 1},
	0x56: {"LSR $%02x,X", 1},
	0x58: {"CLI", 0},
	0x59: {"EOR $%04x,Y", 2},
	0x5d: {"EOR $%04x,X", 2},
	0x5e: {"LSR $%04x,X", 2},

	0x60: {"RTS", 0},
	0x61: {"ADC ($%02x,X)", 1},
	0x65: {"ADC $%02x", 1},
	0x66: {"ROR $%02x", 1},
	0x68: {"PLA", 0},
	0x69: {"ADC #$%02x", 1},
	0x6a: {"ROR A", 0},
	0x6c: {"JMP ($%04x)", 2},
	0x6d: {"ADC $%04x", 2},
	0x6e: {"ROR $%04x", 2},

	0x70: {"BVS $%02x", 1},
	0x71: {"ADC ($%02x),Y", 1},
	0x75: {"ADC $%02x,X", 1},
	0x76: {"ROR $%02x,X", 1},
	0x78: {"SEI", 0},
	0x79: {"ADC $%02x,Y", 1},
	0x7d: {"ADC $%04x,X", 2},
	0x7e: {"ROR $%04x,X", 2},

	0x81: {"STA ($%02x,X)", 1},
	0x84: {"STY $%02x", 1},
	0x85: {"STA $%02x", 1},
	0x86: {"STX $%02x", 1},
	0x88: {"DEY", 0},
	0x8a: {"TXA", 0},
	0x8c: {"STY $%04x", 2},
	0x8d: {"STA $%04x", 2},
	0x8e: {"STX $%04x", 2},

	0x90: {"BCC $%02x", 1},
	0x91: {"STA ($%02x),Y", 1},
	0x94: {"STY $%02x,X", 1},
	0x95: {"STA $%02x,X", 1},
	0x96: {"STX $%02x,Y", 1},
	0x98: {"TYA", 0},
	0x99: {"STA $%04x,Y", 2},
	0x9a: {"TXS", 0},
	0x9d: {"STA $%04x,X", 2},

	0xa0: {"LDY #$%02x", 1},
	0xa1: {"LDA ($%02x,X)", 1},
	0xa2: {"LDX #$%02x", 1},
	0xa4: {"LDY $%02x", 1},
	0xa5: {"LDA $%02x", 1},
	0xa6: {"LDX $%02x", 1},
	0xa8: {"TAY", 0},
	0xa9: {"LDA #$%02x", 1},
	0xaa: {"TAX", 0},
	0xac: {"LDY $%04x", 2},
	0xad: {"LDA $%04x", 2},
	0xae: {"LDX $%04x", 2},

	0xb0: {"BCS $%02x", 1},
	0xb1: {"LDA ($%02x),Y", 1},
	0xb4: {"LDY $%02x,X", 1},
	0xb5: {"LDA $%02x,X", 1},
	0xb6: {"LDX $%02x,Y", 1},
	0xb8: {"CLV", 0},
	0xb9: {"LDA $%04x,Y", 2},
	0xba: {"TSX", 0},
	0xbc: {"LDY $%04x,X", 2},
	0xbd: {"LDA $%04x,X", 2},
	0xbe: {"LDX $%04x,Y", 2},

	0xc0: {"CPY #$%02x", 1},
	0xc1: {"CMP ($%02x,X)", 1},
	0xc4: {"CPY $%02x", 1},
	0xc5: {"CMP $%02x", 1},
	0xc6: {"DEC $%02x", 1},
	0xc8: {"INY", 0},
	0xc9: {"CMP #$%02x", 1},
	0xca: {"DEX", 0},
	0xcc: {"CPY $%04x", 2},
	0xcd: {"CMP $%04x", 2},
	0xce: {"DEC $%04x", 2},

	0xd0: {"BNE $%02x", 1},
	0xd1: {"CMP ($%02x),Y", 1},
	0xd5: {"CMP $%02x,X", 1},
	0xd6: {"DEC $%02x,X", 1},
	0xd8: {"CLD", 0},
	0xd9: {"CMP $%04x,Y", 2},
	0xdd: {"CMP $%04x,X", 2},
	0xde: {"DEC $%04x,X", 2},

	0xe0: {"CPX #$%02x", 1},
	0xe1: {"SBC ($%02x,X)", 1},
	0xe4: {"CPX $%02x", 1},
	0xe5: {"SBC $%02x", 1},
	0xe6: {"INC $%02x", 1},
	0xe8: {"INX", 0},
	0xe9: {"SBC #$%02x", 1},
	0xea: {"NOP", 0},
	0xec: {"CPX $%04x", 2},
	0xed: {"SBC $%04x", 2},
	0xee: {"INC $%04x", 2},

	0xf0: {"BEQ $%02x", 1},
	0xf1: {"SBC ($%02x),Y", 1},
	0xf5: {"SBC $%02x,X", 1},
	0xf6: {"INC $%02x,X", 1},
	0xf8: {"SED", 0},
	0xf9: {"SBC $%04x,Y", 2},
	0xfd: {"SBC $%04x,X", 2},
	0xfe: {"INC $%04x,X", 2},
}

func DecodeAssemblerProcedure(proc *procedure.Procedure, code []byte, addr int) error {
	cd := types.NewCodeData(code, 0, 0)

	enterIC, err := cd.GetSelfRefPointer(addr - 2)
	if err != nil {
		return err
	}
	proc.EnterIC = enterIC
	proc.EntryPoints[proc.EnterIC] = true

	pos := 4

	// Read base relocations
	baseRelocs := make(map[int]bool)
	baseCount, err := cd.ReadWordAt(addr - pos)
	if err != nil {
		return err
	}
	pos += 2
	for i := 0; i < int(baseCount); i++ {
		ptr, err := cd.GetSelfRefPointer(addr - pos)
		if err != nil {
			return err
		}
		baseRelocs[ptr] = true
		pos += 2
	}

	// Read segment relocations
	segRelocs := make(map[int]bool)
	segRelocCount, err := cd.ReadWordAt(addr - pos)
	if err != nil {
		return err
	}
	pos += 2
	for i := 0; i < int(segRelocCount); i++ {
		ptr, err := cd.GetSelfRefPointer(addr - pos)
		if err != nil {
			return err
		}
		segRelocs[ptr] = true
		pos += 2
	}

	// Read procedure relocations
	procRelocs := make(map[int]bool)
	procRelocCount, err := cd.ReadWordAt(addr - pos)
	if err != nil {
		return err
	}
	pos += 2
	for i := 0; i < int(procRelocCount); i++ {
		ptr, err := cd.GetSelfRefPointer(addr - pos)
		if err != nil {
			return err
		}
		procRelocs[ptr] = true
		pos += 2
	}

	// Read interpreter relocations
	interpRelocs := make(map[int]bool)
	interpRelocCount, err := cd.ReadWordAt(addr - pos)
	if err != nil {
		return err
	}
	for i := 0; i < int(interpRelocCount); i++ {
		ptr, err := cd.GetSelfRefPointer(addr - pos)
		if err != nil {
			return err
		}
		interpRelocs[ptr] = true
		pos += 2
	}

	// Decode instructions
	ipc := proc.EnterIC
	done := false

	for !done && ipc < len(code) {
		op, err := cd.ReadByteAt(ipc)
		if err != nil {
			break
		}

		opcode, ok := WDC6502[op]
		if !ok {
			// Unknown opcode
			inst := types.NewInstruction([]byte{op},
				fmt.Sprintf("???     %02x", op),
				nil, nil, nil, nil, false, []string{}, nil, []types.PseudoCode{},
			)
			proc.Instructions[ipc] = inst
			ipc++
			continue
		}

		param := 0
		machCodeStr := fmt.Sprintf("%02x", op)

		if opcode.ParamLength == 1 {
			// Check if it's a branch instruction
			isBranch := (op&0x1F) == 0x10 && (op == 0x10 || op == 0x30 || op == 0x50 ||
				op == 0x70 || op == 0x90 || op == 0xB0 || op == 0xD0 || op == 0xF0)

			if isBranch {
				// Relative branch
				offsetByte, _ := cd.ReadByteAt(ipc + 1)
				offset := int(offsetByte)
				if offset > 127 {
					offset -= 256
				}
				param = ipc + 2 + offset
				proc.EntryPoints[param] = true
				machCodeStr += fmt.Sprintf(" %04x ", param)
			} else {
				paramByte, _ := cd.ReadByteAt(ipc + 1)
				param = int(paramByte)
				machCodeStr += fmt.Sprintf(" %02x   ", param)
			}
		} else if opcode.ParamLength == 2 {
			paramWord, _ := cd.ReadWordAt(ipc + 1)
			param = int(paramWord)
			if procRelocs[ipc+1] {
				param += proc.EnterIC
			}
			if op == 0x20 || op == 0x4C {
				proc.EntryPoints[param] = true
			}
			machCodeStr += fmt.Sprintf(" %04x ", param)
		} else {
			machCodeStr += "      "
		}
		var mnemonic string
		if opcode.ParamLength == 0 {
			mnemonic = machCodeStr + opcode.Mnemonic
		} else {
			mnemonic = machCodeStr + fmt.Sprintf(opcode.Mnemonic, param)
		}
		inst := types.NewInstruction([]byte{op},
			mnemonic, nil, nil, nil, nil, false, []string{}, nil, []types.PseudoCode{},
		)

		if procRelocs[ipc+1] && opcode.ParamLength > 0 {
			comment := " <- proc relocated"
			inst.Comment = &comment
		}

		proc.Instructions[ipc] = inst
		ipc++
		ipc += opcode.ParamLength

		if op == 0x60 {
			done = true
		}
	}

	// Decode data section (hex dump with ASCII)
	s := ""
	sh := ""
	i := ipc

	for i < (addr - pos) {
		if i%16 == 0 && s != "" {
			mnemonic := s + " | " + sh
			inst := types.NewInstruction([]byte{},
				mnemonic, nil, nil, nil, nil, false, []string{}, nil, []types.PseudoCode{},
			)
			proc.Instructions[((i-1)/16)*16] = inst
			s = ""
			sh = ""
		} else if i%8 == 0 && s != "" {
			s += " -"
			sh += " "
		}

		if procRelocs[i] {
			word, _ := cd.ReadWordAt(i)
			s += fmt.Sprintf(" *%04x", int(word)+proc.EnterIC)
			sh += "  "
			i += 2
		} else {
			b := code[i]
			s += fmt.Sprintf(" %02x", b)
			if b >= 0x20 && b <= 0x7e {
				sh += string(b)
			} else {
				sh += "."
			}
			i++
		}
	}

	if s != "" {
		padding := 48 - len(s)
		if padding < 0 {
			padding = 0
		}
		mnemonic := s + fmt.Sprintf("%*s", padding, "") + " | " + sh
		inst := types.NewInstruction([]byte{},
			mnemonic, nil, nil, nil, nil, false, []string{}, nil, []types.PseudoCode{},
		)
		proc.Instructions[((addr-pos-1)/16)*16] = inst
	}

	return nil
}
