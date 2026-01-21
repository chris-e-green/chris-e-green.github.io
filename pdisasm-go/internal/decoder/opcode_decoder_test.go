package decoder

import (
	"testing"

	"pdisasm-go/internal/procedure"
	"pdisasm-go/internal/segment"
	"pdisasm-go/internal/types"
)

func TestDecodeSimpleOpcodes(t *testing.T) {
	// Test simple no-parameter opcodes
	data := []byte{ABI, ABR, ADI, ADR, LAND}
	cd := types.NewCodeData(data, 0, 0)
	decoder := NewOpcodeDecoder(cd)

	seg := segment.NewSegment(0, 100, "TEST", segment.Linked, 0, 1, 0, 0)
	proc := procedure.NewProcedure()
	proc.LexicalLevel = 1
	allLocs := make(map[string]*types.Location)

	tests := []struct {
		opcode   uint8
		expected string
	}{
		{ABI, "ABI"},
		{ABR, "ABR"},
		{ADI, "ADI"},
		{ADR, "ADR"},
		{LAND, "LAND"},
	}

	for i, tt := range tests {
		decoded, err := decoder.Decode(tt.opcode, i, seg, 1, 1, proc, 0, allLocs)
		if err != nil {
			t.Errorf("Failed to decode opcode 0x%02x: %v", tt.opcode, err)
			continue
		}
		if decoded.Mnemonic != tt.expected {
			t.Errorf("opcode 0x%02x: expected mnemonic %s, got %s", tt.opcode, tt.expected, decoded.Mnemonic)
		}
		if decoded.BytesConsumed != 1 {
			t.Errorf("opcode 0x%02x: expected 1 byte consumed, got %d", tt.opcode, decoded.BytesConsumed)
		}
	}
}

func TestDecodeSLDC(t *testing.T) {
	// Test SLDC opcodes (0x00-0x7F)
	data := []byte{0x00, 0x01, 0x42, 0x7F}
	cd := types.NewCodeData(data, 0, 0)
	decoder := NewOpcodeDecoder(cd)

	seg := segment.NewSegment(0, 100, "TEST", segment.Linked, 0, 1, 0, 0)
	proc := procedure.NewProcedure()
	allLocs := make(map[string]*types.Location)

	tests := []struct {
		opcode uint8
		value  int
	}{
		{0x00, 0},
		{0x01, 1},
		{0x42, 0x42},
		{0x7F, 0x7F},
	}

	for _, tt := range tests {
		decoded, err := decoder.Decode(tt.opcode, 0, seg, 1, 1, proc, 0, allLocs)
		if err != nil {
			t.Errorf("Failed to decode SLDC 0x%02x: %v", tt.opcode, err)
			continue
		}
		if decoded.Mnemonic != "SLDC" {
			t.Errorf("SLDC 0x%02x: expected mnemonic SLDC, got %s", tt.opcode, decoded.Mnemonic)
		}
		if len(decoded.Params) != 1 || decoded.Params[0] != tt.value {
			t.Errorf("SLDC 0x%02x: expected param %d, got %v", tt.opcode, tt.value, decoded.Params)
		}
	}
}

func TestDecodeCSP(t *testing.T) {
	// Test CSP (Call Standard Procedure)
	data := []byte{CSP, 0x01} // NEW
	cd := types.NewCodeData(data, 0, 0)
	decoder := NewOpcodeDecoder(cd)

	seg := segment.NewSegment(0, 100, "TEST", segment.Linked, 0, 1, 0, 0)
	proc := procedure.NewProcedure()
	allLocs := make(map[string]*types.Location)

	decoded, err := decoder.Decode(CSP, 0, seg, 1, 1, proc, 0, allLocs)
	if err != nil {
		t.Fatalf("Failed to decode CSP: %v", err)
	}

	if decoded.Mnemonic != "CSP" {
		t.Errorf("Expected mnemonic CSP, got %s", decoded.Mnemonic)
	}
	if decoded.BytesConsumed != 2 {
		t.Errorf("Expected 2 bytes consumed, got %d", decoded.BytesConsumed)
	}
	if len(decoded.Params) != 1 || decoded.Params[0] != 1 {
		t.Errorf("Expected param [1], got %v", decoded.Params)
	}
}

func TestDecodeLDCI(t *testing.T) {
	// Test LDCI (Load Constant Integer) - 3 bytes: opcode + 2-byte word
	data := []byte{LDCI, 0x42, 0x01} // Little-endian: 0x0142
	cd := types.NewCodeData(data, 0, 0)
	decoder := NewOpcodeDecoder(cd)

	seg := segment.NewSegment(0, 100, "TEST", segment.Linked, 0, 1, 0, 0)
	proc := procedure.NewProcedure()
	allLocs := make(map[string]*types.Location)

	decoded, err := decoder.Decode(LDCI, 0, seg, 1, 1, proc, 0, allLocs)
	if err != nil {
		t.Fatalf("Failed to decode LDCI: %v", err)
	}

	if decoded.Mnemonic != "LDCI" {
		t.Errorf("Expected mnemonic LDCI, got %s", decoded.Mnemonic)
	}
	if decoded.BytesConsumed != 3 {
		t.Errorf("Expected 3 bytes consumed, got %d", decoded.BytesConsumed)
	}
	// Word is read as little-endian: low byte first
	expected := 0x0142
	if len(decoded.Params) != 1 || decoded.Params[0] != expected {
		t.Errorf("Expected param [%d], got %v", expected, decoded.Params)
	}
}

func TestDecodeComparator(t *testing.T) {
	tests := []struct {
		name     string
		data     []byte
		expected ComparatorInfo
	}{
		{
			name: "REAL",
			data: []byte{2},
			expected: ComparatorInfo{
				Suffix:   "REAL",
				Prefix:   "Real",
				DataType: "REAL",
				Inc:      1,
			},
		},
		{
			name: "STRING",
			data: []byte{4},
			expected: ComparatorInfo{
				Suffix:   "STR",
				Prefix:   "String",
				DataType: "STRING",
				Inc:      1,
			},
		},
		{
			name: "BOOLEAN",
			data: []byte{6},
			expected: ComparatorInfo{
				Suffix:   "BOOL",
				Prefix:   "Boolean",
				DataType: "BOOLEAN",
				Inc:      1,
			},
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			cd := types.NewCodeData(tt.data, 0, 0)
			decoder := NewOpcodeDecoder(cd)
			result := decoder.DecodeComparator(0)

			if result.Suffix != tt.expected.Suffix {
				t.Errorf("Suffix: expected %s, got %s", tt.expected.Suffix, result.Suffix)
			}
			if result.Prefix != tt.expected.Prefix {
				t.Errorf("Prefix: expected %s, got %s", tt.expected.Prefix, result.Prefix)
			}
			if result.DataType != tt.expected.DataType {
				t.Errorf("DataType: expected %s, got %s", tt.expected.DataType, result.DataType)
			}
			if result.Inc != tt.expected.Inc {
				t.Errorf("Inc: expected %d, got %d", tt.expected.Inc, result.Inc)
			}
		})
	}
}
