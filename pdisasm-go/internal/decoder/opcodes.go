package decoder

import "pdisasm-go/internal/types"

var CSPProcs = map[int]struct {
	Name       string
	Parameters []types.Identifier
	ReturnType string
}{
	0:  {"IOC", []types.Identifier{}, ""},
	1:  {"NEW", []types.Identifier{types.NewIdentifier("PTR", "POINTER"), types.NewIdentifier("SIZE", "INTEGER")}, ""},
	2:  {"MOVL", []types.Identifier{types.NewIdentifier("SRCADDR", "POINTER"), types.NewIdentifier("SRCOFFS", "INTEGER"), types.NewIdentifier("DESTADDR", "POINTER"), types.NewIdentifier("DESTOFFS", "INTEGER"), types.NewIdentifier("COUNT", "INTEGER")}, ""},
	3:  {"MOVR", []types.Identifier{types.NewIdentifier("SRCADDR", "POINTER"), types.NewIdentifier("SRCOFFS", "INTEGER"), types.NewIdentifier("DESTADDR", "POINTER"), types.NewIdentifier("DESTOFFS", "INTEGER"), types.NewIdentifier("COUNT", "INTEGER")}, ""},
	4:  {"EXIT", []types.Identifier{types.NewIdentifier("SEGMENT", "INTEGER"), types.NewIdentifier("PROCEDURE", "INTEGER")}, ""},
	5:  {"UNITREAD", []types.Identifier{types.NewIdentifier("MODE", "INTEGER"), types.NewIdentifier("BLOCKNUM", "INTEGER"), types.NewIdentifier("BYTCOUNT", "INTEGER"), types.NewIdentifier("BUFFADDR", "POINTER"), types.NewIdentifier("BUFFOFFS", "INTEGER"), types.NewIdentifier("UNIT", "INTEGER")}, ""},
	6:  {"UNITWRITE", []types.Identifier{types.NewIdentifier("MODE", "INTEGER"), types.NewIdentifier("BLOCKNUM", "INTEGER"), types.NewIdentifier("BYTCOUNT", "INTEGER"), types.NewIdentifier("BUFFADDR", "POINTER"), types.NewIdentifier("BUFFOFFS", "INTEGER"), types.NewIdentifier("UNIT", "INTEGER")}, ""},
	7:  {"IDSEARCH", []types.Identifier{types.NewIdentifier("SYMCURSOR", "0..1023"), types.NewIdentifier("SYMBUF", "PACKED ARRAY[0..1023] OF CHAR")}, ""},
	8:  {"TREESEARCH", []types.Identifier{types.NewIdentifier("ROOTP", "^NODE"), types.NewIdentifier("FOUNDP", "^NODE"), types.NewIdentifier("TARGET", "PACKED ARRAY [1..8] OF CHAR")}, "INTEGER"},
	9:  {"TIME", []types.Identifier{types.NewIdentifier("TIME1", "INTEGER"), types.NewIdentifier("TIME2", "INTEGER")}, ""},
	10: {"FLCH", []types.Identifier{types.NewIdentifier("DESTADDR", "POINTER"), types.NewIdentifier("DESTOFFS", "INTEGER"), types.NewIdentifier("COUNT", "INTEGER"), types.NewIdentifier("SRC", "CHAR")}, ""},
	11: {"SCAN", []types.Identifier{types.NewIdentifier("JUNK", "INTEGER"), types.NewIdentifier("DESTADDR", "POINTER"), types.NewIdentifier("DESTOFFS", "INTEGER"), types.NewIdentifier("CH", "CHAR"), types.NewIdentifier("CHECK", "INTEGER"), types.NewIdentifier("COUNT", "INTEGER")}, "INTEGER"},
	12: {"UNITSTATUS", []types.Identifier{types.NewIdentifier("CTRLWORD", "INTEGER"), types.NewIdentifier("STATADDR", "POINTER"), types.NewIdentifier("STATOFFS", "INTEGER"), types.NewIdentifier("UNIT", "INTEGER")}, ""},
	21: {"LOADSEGMENT", []types.Identifier{types.NewIdentifier("SEGMENT", "INTEGER")}, ""},
	22: {"UNLOADSEGMENT", []types.Identifier{types.NewIdentifier("SEGMENT", "INTEGER")}, ""},
	23: {"TRUNC", []types.Identifier{types.NewIdentifier("NUM", "REAL")}, "INTEGER"},
	24: {"ROUND", []types.Identifier{types.NewIdentifier("NUM", "REAL")}, "INTEGER"},
	25: {"SIN", []types.Identifier{}, ""},
	26: {"COS", []types.Identifier{}, ""},
	27: {"LOG", []types.Identifier{}, ""},
	28: {"ATAN", []types.Identifier{}, ""},
	29: {"LN", []types.Identifier{}, ""},
	30: {"EXP", []types.Identifier{}, ""},
	31: {"SQRT", []types.Identifier{}, ""},
	32: {"MARK", []types.Identifier{types.NewIdentifier("NP", "POINTER")}, ""},
	33: {"RELEASE", []types.Identifier{types.NewIdentifier("NP", "POINTER")}, ""},
	34: {"IORESULT", []types.Identifier{}, "INTEGER"},
	35: {"UNITBUSY", []types.Identifier{types.NewIdentifier("UNIT", "INTEGER")}, "BOOLEAN"},
	36: {"POT", []types.Identifier{types.NewIdentifier("NUM", "INTEGER")}, "REAL"},
	37: {"UNITWAIT", []types.Identifier{types.NewIdentifier("UNIT", "INTEGER")}, ""},
	38: {"UNITCLEAR", []types.Identifier{types.NewIdentifier("UNIT", "INTEGER")}, ""},
	39: {"HALT", []types.Identifier{}, ""},
	40: {"MEMAVAIL", []types.Identifier{}, "INTEGER"},
}

const (
	SLDC0   uint8 = 0x00
	SLDC127 uint8 = 0x7f
	ABI     uint8 = 0x80
	ABR     uint8 = 0x81
	ADI     uint8 = 0x82
	ADR     uint8 = 0x83
	LAND    uint8 = 0x84
	DIF     uint8 = 0x85
	DVI     uint8 = 0x86
	DVR     uint8 = 0x87
	CHK     uint8 = 0x88
	FLO     uint8 = 0x89
	FLT     uint8 = 0x8a
	INN     uint8 = 0x8b
	INT     uint8 = 0x8c
	LOR     uint8 = 0x8d
	MODI    uint8 = 0x8e
	MPI     uint8 = 0x8f
	MPR     uint8 = 0x90
	NGI     uint8 = 0x91
	NGR     uint8 = 0x92
	LNOT    uint8 = 0x93
	SRS     uint8 = 0x94
	SBI     uint8 = 0x95
	SBR     uint8 = 0x96
	SGS     uint8 = 0x97
	SQI     uint8 = 0x98
	SQR     uint8 = 0x99
	STO     uint8 = 0x9a
	IXS     uint8 = 0x9b
	UNI     uint8 = 0x9c
	LDE     uint8 = 0x9d
	CSP     uint8 = 0x9e
	LDCN    uint8 = 0x9f
	ADJ     uint8 = 0xa0
	FJP     uint8 = 0xa1
	INC     uint8 = 0xa2
	IND     uint8 = 0xa3
	IXA     uint8 = 0xa4
	LAO     uint8 = 0xa5
	LSA     uint8 = 0xa6
	LAE     uint8 = 0xa7
	MOV     uint8 = 0xa8
	LDO     uint8 = 0xa9
	SAS     uint8 = 0xaa
	SRO     uint8 = 0xab
	XJP     uint8 = 0xac
	RNP     uint8 = 0xad
	CIP     uint8 = 0xae
	EQL     uint8 = 0xaf
	GEQ     uint8 = 0xb0
	GRT     uint8 = 0xb1
	LDA     uint8 = 0xb2
	LDC     uint8 = 0xb3
	LEQ     uint8 = 0xb4
	LES     uint8 = 0xb5
	LOD     uint8 = 0xb6
	NEQ     uint8 = 0xb7
	STR     uint8 = 0xb8
	UJP     uint8 = 0xb9
	LDP     uint8 = 0xba
	STP     uint8 = 0xbb
	LDM     uint8 = 0xbc
	STM     uint8 = 0xbd
	LDB     uint8 = 0xbe
	STB     uint8 = 0xbf
	IXP     uint8 = 0xc0
	RBP     uint8 = 0xc1
	CBP     uint8 = 0xc2
	EQUI    uint8 = 0xc3
	GEQI    uint8 = 0xc4
	GRTI    uint8 = 0xc5
	LLA     uint8 = 0xc6
	LDCI    uint8 = 0xc7
	LEQI    uint8 = 0xc8
	LESI    uint8 = 0xc9
	LDL     uint8 = 0xca
	NEQI    uint8 = 0xcb
	STL     uint8 = 0xcc
	CXP     uint8 = 0xcd
	CLP     uint8 = 0xce
	CGP     uint8 = 0xcf
	LPA     uint8 = 0xd0
	STE     uint8 = 0xd1
	NOP     uint8 = 0xd2
	UNK1    uint8 = 0xd3
	UNK2    uint8 = 0xd4
	BPT     uint8 = 0xd5
	XIT     uint8 = 0xd6
	NOP2    uint8 = 0xd7
	SLDL1   uint8 = 0xd8
	SLDL2   uint8 = 0xd9
	SLDL3   uint8 = 0xda
	SLDL4   uint8 = 0xdb
	SLDL5   uint8 = 0xdc
	SLDL6   uint8 = 0xdd
	SLDL7   uint8 = 0xde
	SLDL8   uint8 = 0xdf
	SLDL9   uint8 = 0xe0
	SLDL10  uint8 = 0xe1
	SLDL11  uint8 = 0xe2
	SLDL12  uint8 = 0xe3
	SLDL13  uint8 = 0xe4
	SLDL14  uint8 = 0xe5
	SLDL15  uint8 = 0xe6
	SLDL16  uint8 = 0xe7
	SLDO1   uint8 = 0xe8
	SLDO2   uint8 = 0xe9
	SLDO3   uint8 = 0xea
	SLDO4   uint8 = 0xeb
	SLDO5   uint8 = 0xec
	SLDO6   uint8 = 0xed
	SLDO7   uint8 = 0xee
	SLDO8   uint8 = 0xef
	SLDO9   uint8 = 0xf0
	SLDO10  uint8 = 0xf1
	SLDO11  uint8 = 0xf2
	SLDO12  uint8 = 0xf3
	SLDO13  uint8 = 0xf4
	SLDO14  uint8 = 0xf5
	SLDO15  uint8 = 0xf6
	SLDO16  uint8 = 0xf7
	SIND0   uint8 = 0xf8
	SIND1   uint8 = 0xf9
	SIND2   uint8 = 0xfa
	SIND3   uint8 = 0xfb
	SIND4   uint8 = 0xfc
	SIND5   uint8 = 0xfd
	SIND6   uint8 = 0xfe
	SIND7   uint8 = 0xff
)
