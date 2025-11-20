//
//  WDC6502.swift
//  PascalDisassembler
//
//  Created by Christopher Green on 27/9/2025.
//

import Foundation

struct Wdc6502OpInfo {
    var mnemonic: String
    var paramLength: Int
}

let wdc6502: [UInt8: Wdc6502OpInfo] = [
    0x00:Wdc6502OpInfo(mnemonic:"BRK",paramLength: 0),
    0x01:Wdc6502OpInfo(mnemonic:"ORA ($%02x,X)",paramLength: 1),
    0x05:Wdc6502OpInfo(mnemonic:"ORA $%02x",paramLength: 1),
    0x06:Wdc6502OpInfo(mnemonic:"ASL $%02x",paramLength: 1),
    0x08:Wdc6502OpInfo(mnemonic:"PHP",paramLength: 0),
    0x09:Wdc6502OpInfo(mnemonic:"ORA #$%02x",paramLength: 1),
    0x0A:Wdc6502OpInfo(mnemonic:"ASL A",paramLength: 0),
    0x0d:Wdc6502OpInfo(mnemonic:"ORA $%04x",paramLength: 2),
    0x0e:Wdc6502OpInfo(mnemonic:"ASL $%04x",paramLength: 2),

    0x10:Wdc6502OpInfo(mnemonic:"BPL $%02x",paramLength: 1),
    0x11:Wdc6502OpInfo(mnemonic:"ORA ($%02x),Y",paramLength: 1),
    0x15:Wdc6502OpInfo(mnemonic:"ORA $%02x,X",paramLength: 1),
    0x16:Wdc6502OpInfo(mnemonic:"ASL $%02x,X",paramLength: 1),
    0x18:Wdc6502OpInfo(mnemonic:"CLC",paramLength: 0),
    0x19:Wdc6502OpInfo(mnemonic:"ORA $%04x,Y",paramLength: 2),
    0x1d:Wdc6502OpInfo(mnemonic:"ORA $%04x,X",paramLength: 2),
    0x1e:Wdc6502OpInfo(mnemonic:"ASL $%04x,X",paramLength: 2),

    0x20:Wdc6502OpInfo(mnemonic:"JSR $%04x",paramLength: 2),
    0x21:Wdc6502OpInfo(mnemonic:"AND ($%02x,X)",paramLength: 1),
    0x24:Wdc6502OpInfo(mnemonic:"BIT $%02x",paramLength: 1),
    0x25:Wdc6502OpInfo(mnemonic:"AND $%02x",paramLength: 1),
    0x26:Wdc6502OpInfo(mnemonic:"ROL $%02x",paramLength: 1),
    0x28:Wdc6502OpInfo(mnemonic:"PLP",paramLength: 0),
    0x29:Wdc6502OpInfo(mnemonic:"AND #$%02x",paramLength: 1),
    0x2a:Wdc6502OpInfo(mnemonic:"ROL A",paramLength: 0),
    0x2c:Wdc6502OpInfo(mnemonic:"BIT $%04x",paramLength: 2),
    0x2d:Wdc6502OpInfo(mnemonic:"AND $%04x",paramLength: 2),
    0x2e:Wdc6502OpInfo(mnemonic:"ROL $%04x",paramLength: 2),

    0x30:Wdc6502OpInfo(mnemonic:"BMI $%02x",paramLength: 1),
    0x31:Wdc6502OpInfo(mnemonic:"AND ($%02x),Y",paramLength: 1),
    0x35:Wdc6502OpInfo(mnemonic:"AND $%02x,X",paramLength: 1),
    0x36:Wdc6502OpInfo(mnemonic:"ROL $%02x,X",paramLength: 1),
    0x38:Wdc6502OpInfo(mnemonic:"SEC",paramLength: 0),
    0x39:Wdc6502OpInfo(mnemonic:"AND $%04x,Y",paramLength: 2),
    0x3d:Wdc6502OpInfo(mnemonic:"AND $%04x,X",paramLength: 2),
    0x3e:Wdc6502OpInfo(mnemonic:"ROL $%04x,X",paramLength: 2),

    0x40:Wdc6502OpInfo(mnemonic:"RTI",paramLength: 0),
    0x41:Wdc6502OpInfo(mnemonic:"EOR ($%02x,X)",paramLength: 1),
    0x45:Wdc6502OpInfo(mnemonic:"EOR $%02x",paramLength: 1),
    0x46:Wdc6502OpInfo(mnemonic:"LSR $%02x",paramLength: 1),
    0x48:Wdc6502OpInfo(mnemonic:"PHA",paramLength: 0),
    0x49:Wdc6502OpInfo(mnemonic:"EOR #$%02x",paramLength: 1),
    0x4a:Wdc6502OpInfo(mnemonic:"LSR A",paramLength: 0),
    0x4c:Wdc6502OpInfo(mnemonic:"JMP $%04x",paramLength: 2),
    0x4d:Wdc6502OpInfo(mnemonic:"EOR $%04x",paramLength: 2),
    0x4e:Wdc6502OpInfo(mnemonic:"LSR $%04x",paramLength: 2),

    0x50:Wdc6502OpInfo(mnemonic:"BVC $%02x",paramLength: 1),
    0x51:Wdc6502OpInfo(mnemonic:"EOR ($%02x),Y",paramLength: 1),
    0x55:Wdc6502OpInfo(mnemonic:"EOR $%02x,X",paramLength: 1),
    0x56:Wdc6502OpInfo(mnemonic:"LSR $%02x,X",paramLength: 1),
    0x58:Wdc6502OpInfo(mnemonic:"CLI",paramLength: 0),
    0x59:Wdc6502OpInfo(mnemonic:"EOR $%04x,Y",paramLength: 2),
    0x5d:Wdc6502OpInfo(mnemonic:"EOR $%04x,X",paramLength: 2),
    0x5e:Wdc6502OpInfo(mnemonic:"LSR $%04x,X",paramLength: 2),

    0x60:Wdc6502OpInfo(mnemonic:"RTS",paramLength: 0),
    0x61:Wdc6502OpInfo(mnemonic:"ADC ($%02x,X)",paramLength: 1),
    0x65:Wdc6502OpInfo(mnemonic:"ADC $%02x",paramLength: 1),
    0x66:Wdc6502OpInfo(mnemonic:"ROR $%02x",paramLength: 1),
    0x68:Wdc6502OpInfo(mnemonic:"PLA",paramLength: 0),
    0x69:Wdc6502OpInfo(mnemonic:"ADC #$%02x",paramLength: 1),
    0x6a:Wdc6502OpInfo(mnemonic:"ROR A",paramLength: 0),
    0x6c:Wdc6502OpInfo(mnemonic:"JMP ($%04x)",paramLength: 2),
    0x6d:Wdc6502OpInfo(mnemonic:"ADC $%04x",paramLength: 2),
    0x6e:Wdc6502OpInfo(mnemonic:"ROR $%04x",paramLength: 2),

    0x70:Wdc6502OpInfo(mnemonic:"BVS $%02x",paramLength: 1),
    0x71:Wdc6502OpInfo(mnemonic:"ADC ($%02x),Y",paramLength: 1),
    0x75:Wdc6502OpInfo(mnemonic:"ADC $%02x,X",paramLength: 1),
    0x76:Wdc6502OpInfo(mnemonic:"ROR $%02x,X",paramLength: 1),
    0x78:Wdc6502OpInfo(mnemonic:"SEI",paramLength: 0),
    0x79:Wdc6502OpInfo(mnemonic:"ADC $%02x,Y",paramLength: 1),
    0x7d:Wdc6502OpInfo(mnemonic:"ADC $%04x,X",paramLength: 2),
    0x7e:Wdc6502OpInfo(mnemonic:"ROR $%04x,X",paramLength: 2),

    0x81:Wdc6502OpInfo(mnemonic:"STA ($%02x,X)",paramLength: 1),
    0x84:Wdc6502OpInfo(mnemonic:"STY $%02x",paramLength: 1),
    0x85:Wdc6502OpInfo(mnemonic:"STA $%02x",paramLength: 1),
    0x86:Wdc6502OpInfo(mnemonic:"STX $%02x",paramLength: 1),
    0x88:Wdc6502OpInfo(mnemonic:"DEY",paramLength: 0),
    0x8a:Wdc6502OpInfo(mnemonic:"TXA",paramLength: 0),
    0x8c:Wdc6502OpInfo(mnemonic:"STY $%04x",paramLength: 2),
    0x8d:Wdc6502OpInfo(mnemonic:"STA $%04x",paramLength: 2),
    0x8e:Wdc6502OpInfo(mnemonic:"STX $%04x",paramLength: 2),

    0x90:Wdc6502OpInfo(mnemonic:"BCC $%02x",paramLength: 1),
    0x91:Wdc6502OpInfo(mnemonic:"STA ($%02x),Y",paramLength: 1),
    0x94:Wdc6502OpInfo(mnemonic:"STY $%02x,X",paramLength: 1),
    0x95:Wdc6502OpInfo(mnemonic:"STA $%02x,X",paramLength: 1),
    0x96:Wdc6502OpInfo(mnemonic:"STX $%02x,Y",paramLength: 1),
    0x98:Wdc6502OpInfo(mnemonic:"TYA",paramLength: 0),
    0x99:Wdc6502OpInfo(mnemonic:"STA $%04x,Y",paramLength: 2),
    0x9a:Wdc6502OpInfo(mnemonic:"TXS",paramLength: 0),
    0x9d:Wdc6502OpInfo(mnemonic:"STA $%04x,X",paramLength: 2),

    0xa0:Wdc6502OpInfo(mnemonic:"LDY #$%02x",paramLength: 1),
    0xa1:Wdc6502OpInfo(mnemonic:"LDA ($%02x,X)",paramLength: 1),
    0xa2:Wdc6502OpInfo(mnemonic:"LDX #$%02x",paramLength: 1),
    0xa4:Wdc6502OpInfo(mnemonic:"LDY $%02x",paramLength: 1),
    0xa5:Wdc6502OpInfo(mnemonic:"LDA $%02x",paramLength: 1),
    0xa6:Wdc6502OpInfo(mnemonic:"LDX $%02x",paramLength: 1),
    0xa8:Wdc6502OpInfo(mnemonic:"TAY",paramLength: 0),
    0xa9:Wdc6502OpInfo(mnemonic:"LDA #$%02x",paramLength: 1),
    0xaa:Wdc6502OpInfo(mnemonic:"TAX",paramLength: 0),
    0xac:Wdc6502OpInfo(mnemonic:"LDY $%04x",paramLength: 2),
    0xad:Wdc6502OpInfo(mnemonic:"LDA $%04x",paramLength: 2),
    0xae:Wdc6502OpInfo(mnemonic:"LDX $%04x",paramLength: 2),

    0xb0:Wdc6502OpInfo(mnemonic:"BCS $%02x",paramLength: 1),
    0xb1:Wdc6502OpInfo(mnemonic:"LDA ($%02x),Y",paramLength: 1),
    0xb4:Wdc6502OpInfo(mnemonic:"LDY $%02x,X",paramLength: 1),
    0xb5:Wdc6502OpInfo(mnemonic:"LDA $%02x,X",paramLength: 1),
    0xb6:Wdc6502OpInfo(mnemonic:"LDX $%02x,Y",paramLength: 1),
    0xb8:Wdc6502OpInfo(mnemonic:"CLV",paramLength: 0),
    0xb9:Wdc6502OpInfo(mnemonic:"LDA $%04x,Y",paramLength: 2),
    0xba:Wdc6502OpInfo(mnemonic:"TSX",paramLength: 0),
    0xbc:Wdc6502OpInfo(mnemonic:"LDY $%04x,X",paramLength: 2),
    0xbd:Wdc6502OpInfo(mnemonic:"LDA $%04x,X",paramLength: 2),
    0xbe:Wdc6502OpInfo(mnemonic:"LDX $%04x,Y",paramLength: 2),

    0xc0:Wdc6502OpInfo(mnemonic:"CPY #$%02x",paramLength: 1),
    0xc1:Wdc6502OpInfo(mnemonic:"CMP ($%02x,X)",paramLength: 1),
    0xc4:Wdc6502OpInfo(mnemonic:"CPY $%02x", paramLength: 1),
    0xc5:Wdc6502OpInfo(mnemonic:"CMP $%02x",paramLength: 1),
    0xc6:Wdc6502OpInfo(mnemonic:"DEC $%02x",paramLength: 1),
    0xc8:Wdc6502OpInfo(mnemonic:"INY",paramLength: 0),
    0xc9:Wdc6502OpInfo(mnemonic:"CMP #$%02x",paramLength: 1),
    0xca:Wdc6502OpInfo(mnemonic:"DEX",paramLength: 0),
    0xcc:Wdc6502OpInfo(mnemonic:"CPY $%04x",paramLength: 2),
    0xcd:Wdc6502OpInfo(mnemonic:"CMP $%04x",paramLength: 2),
    0xce:Wdc6502OpInfo(mnemonic:"DEC $%04x",paramLength: 2),

    0xd0:Wdc6502OpInfo(mnemonic:"BNE $%02x",paramLength: 1),
    0xd1:Wdc6502OpInfo(mnemonic:"CMP ($%02x),Y", paramLength: 1),
    0xd5:Wdc6502OpInfo(mnemonic:"CMP $%02x,X",paramLength: 1),
    0xd6:Wdc6502OpInfo(mnemonic:"DEC $%02x,X",paramLength: 1),
    0xd8:Wdc6502OpInfo(mnemonic:"CLD",paramLength: 0),
    0xd9:Wdc6502OpInfo(mnemonic:"CMP $%04x,Y",paramLength: 2),
    0xdd:Wdc6502OpInfo(mnemonic:"CMP $%04x,X",paramLength: 2),
    0xde:Wdc6502OpInfo(mnemonic:"DEC $%04x,X",paramLength: 2),

    0xe0:Wdc6502OpInfo(mnemonic:"CPX #$%02x",paramLength: 1),
    0xe1:Wdc6502OpInfo(mnemonic:"SBC ($%02x,X)",paramLength: 1),
    0xe4:Wdc6502OpInfo(mnemonic:"CPX $%02x",paramLength: 1),
    0xe5:Wdc6502OpInfo(mnemonic:"SBC $%02x",paramLength: 1),
    0xe6:Wdc6502OpInfo(mnemonic:"INC $%02x",paramLength: 1),
    0xe8:Wdc6502OpInfo(mnemonic:"INX",paramLength: 0),
    0xe9:Wdc6502OpInfo(mnemonic:"SBC #$%02x",paramLength: 1),
    0xea:Wdc6502OpInfo(mnemonic:"NOP",paramLength: 0),
    0xec:Wdc6502OpInfo(mnemonic:"CPX $%04x",paramLength: 2),
    0xed:Wdc6502OpInfo(mnemonic:"SBC $%04x",paramLength: 2),
    0xee:Wdc6502OpInfo(mnemonic:"INC $%04x",paramLength: 2),

    0xf0:Wdc6502OpInfo(mnemonic:"BEQ $%02x",paramLength: 1),
    0xf1:Wdc6502OpInfo(mnemonic:"SBC ($%02x),Y",paramLength: 1),
    0xf5:Wdc6502OpInfo(mnemonic:"SBC $%02x,X",paramLength: 1),
    0xf6:Wdc6502OpInfo(mnemonic:"INC $%02x,X",paramLength: 1),
    0xf8:Wdc6502OpInfo(mnemonic:"SED",paramLength: 0),
    0xf9:Wdc6502OpInfo(mnemonic:"SBC $%04x,Y",paramLength: 2),
    0xfd:Wdc6502OpInfo(mnemonic:"SBC $%04x,X",paramLength: 2),
    0xfe:Wdc6502OpInfo(mnemonic:"INC $%04x,X",paramLength: 2),
]

func decodeAssemblerProcedure(segmentNumber:Int, procedureNumber:Int, proc: inout Procedure, code: Data, addr: Int) throws {
                    proc.procType = ProcIdentifier(isFunction: false, isAssembly: true, segmentNumber: segmentNumber, procNumber: procedureNumber, procName: "ASMPROC\(procedureNumber)")
                    // proc.name = "ASMPROC\(procedureNumber)"
                    // proc.procedureNumber = procedureNumber
                    let cd = CodeData(data: code, ipc: 0, header: 0)
                    proc.enterIC = try cd.getSelfRefPointer(at: addr - 2)
                    proc.entryPoints.insert(proc.enterIC)
                    var pos = 4

                    var baseRelocs: Set<Int> = []
                    let baseCount = Int(try cd.readWord(at: addr - pos))
                    pos += 2
                    for _ in 0..<baseCount {
                        baseRelocs.insert(try cd.getSelfRefPointer(at: addr - pos))
                        pos += 2
                    }
                    var segRelocs: Set<Int> = []
                    let segRelocCount = Int(try cd.readWord(at: addr - pos))
                    pos += 2
                    for _ in 0..<segRelocCount {
                        segRelocs.insert(try cd.getSelfRefPointer(at: addr - pos))
                        pos += 2
                    }
                    var procRelocs: Set<Int> = []
                    let procRelocCount = Int(try cd.readWord(at: addr - pos))
                    pos += 2
                    for _ in 0..<procRelocCount {
                        procRelocs.insert(try cd.getSelfRefPointer(at: addr - pos))
                        pos += 2
                    }
                    var interpRelocs: Set<Int> = []
                    let interpRelocCount = Int(try cd.readWord(at: addr - pos))
                    for _ in 0..<interpRelocCount {
                        interpRelocs.insert(try cd.getSelfRefPointer(at: addr - pos))
                        pos += 2
                    }
                    var ipc = proc.enterIC
                    var op = try cd.readByte(at: ipc)
                    var done = false
                    repeat {
                        if let opcode = wdc6502[op] {
                            var param = 0
                            var machCodeStr = String(format:"%02x", op)
                            if opcode.paramLength == 1 {
                                let isBranch = [0x10, 0x30, 0x50, 0x70, 0x90, 0xB0, 0xD0, 0xF0].contains(op & 0x1F)

                                if isBranch { 
                                    // it's a relative branch of some sort
                                    var offset = Int(try cd.readByte(at: ipc + 1))
                                    if offset > 127 {
                                        offset -= 256
                                    }
                                    param = ipc + 2 + offset
                                    proc.entryPoints.insert(param)
                                    machCodeStr += String(format:" %04x ", param)
                                } else {
                                    param = Int(try cd.readByte(at: ipc + 1))
                                    machCodeStr += String(format:" %02x   ", param)
                                }
                            } else if opcode.paramLength == 2 {
                                param = Int(try cd.readWord(at: ipc + 1))
                                if procRelocs.contains(ipc + 1) { // adjust for relocation
                                    param += proc.enterIC
                                }
                                if op == 0x20 || op == 0x4c { proc.entryPoints.insert(param)}
                                machCodeStr += String(format:" %04x ", param)
                            } else {
                                machCodeStr += "      "
                            }
                            proc.instructions[ipc] = Instruction(mnemonic: machCodeStr + String(format: opcode.mnemonic, param), isPascal: false, stackState: [])
                            ipc += 1
                            if procRelocs.contains(ipc) && opcode.paramLength > 0 {
                                proc.instructions[ipc - 1]?.comment = " <- proc relocated"
                            }
                            ipc += opcode.paramLength
                            if ipc < code.count {
                                op = try cd.readByte(at: ipc)
                            } else {
                                break
                            }
                        } else {
                            proc.instructions[ipc] = Instruction(mnemonic: String(format: "???     %02x", op), isPascal: false, stackState: [])
                            ipc += 1
                            if ipc < code.count {
                                op = try cd.readByte(at: ipc)
                            } else {
                                break
                            }

                        }
                        if op == 0x60 { done = true }
                        op = code[ipc]
                    } while !done
                    var s = ""
                    var sh = ""
                    var i = ipc
                    while i < (addr - pos) {
                        if i.isMultiple(of: 16) && !s.isEmpty {
                            proc.instructions[((i - 1) / 16) * 16] = Instruction(mnemonic: s + " | " + sh, isPascal: false, stackState: [])
                            s = ""
                            sh = ""
                        } else if i.isMultiple(of: 8) && !s.isEmpty {
                            s += " -"
                            sh += " "
                        }
                        if procRelocs.contains(i) { // adjust for relocation
                            s += String(format: " *%04x", Int(try cd.readWord(at: i)) + proc.enterIC)
                            sh += "  "
                            i += 2
                        } else {
                            s += String(format: " %02x", code[i])
                            if code[i] >= 0x20 && code[i] <= 0x7e {
                                sh.append(Character(UnicodeScalar(code[i])))
                            } else {
                                sh.append(Character("."))
                            }
                            i += 1
                        }
                    }
                    if !s.isEmpty {
                        proc.instructions[((addr - pos - 1) / 16) * 16] = Instruction(mnemonic: s + String(repeating: " ", count: (48 - s.count)) + " | " + sh, isPascal: false, stackState: [])
                    }
}