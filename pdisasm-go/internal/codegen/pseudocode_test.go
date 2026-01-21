package codegen

import (
	"testing"

	"pdisasm-go/internal/decoder"
	"pdisasm-go/internal/procedure"
	"pdisasm-go/internal/simulator"
	"pdisasm-go/internal/types"
)

func TestPseudoCodeGeneratorBasicAssignment(t *testing.T) {
	pcg := NewPseudoCodeGenerator(
		make(map[string]*procedure.ProcIdentifier),
		make(map[string]*types.Location),
	)

	stack := simulator.NewStackSimulator()
	stack.Push("myVar", "INTEGER") // Destination pushed first
	stack.Push("42", "INTEGER")    // Source pushed second

	decoded := &decoder.DecodedInstruction{
		Mnemonic: "STO",
	}

	result := pcg.GenerateForInstruction(decoded, stack)
	expected := "myVar := 42"
	if result != expected {
		t.Errorf("Expected '%s', got '%s'", expected, result)
	}
}

func TestPseudoCodeGeneratorStoreWithLocation(t *testing.T) {
	loc := types.NewLocation(1, nil, nil, nil, "globalVar", "INTEGER")
	labelLookup := map[string]*types.Location{
		loc.String(): loc,
	}

	pcg := NewPseudoCodeGenerator(
		make(map[string]*procedure.ProcIdentifier),
		labelLookup,
	)

	stack := simulator.NewStackSimulator()
	stack.Push("100", "INTEGER")

	decoded := &decoder.DecodedInstruction{
		Mnemonic:    "SRO",
		MemLocation: loc,
	}

	result := pcg.GenerateForInstruction(decoded, stack)
	expected := "globalVar := 100"
	if result != expected {
		t.Errorf("Expected '%s', got '%s'", expected, result)
	}
}

func TestPseudoCodeGeneratorCharAssignment(t *testing.T) {
	loc := types.NewLocation(1, nil, nil, nil, "ch", "CHAR")
	labelLookup := map[string]*types.Location{
		loc.String(): loc,
	}

	pcg := NewPseudoCodeGenerator(
		make(map[string]*procedure.ProcIdentifier),
		labelLookup,
	)

	stack := simulator.NewStackSimulator()
	stack.Push("65", "INTEGER") // ASCII 'A'

	decoded := &decoder.DecodedInstruction{
		Mnemonic:    "STL",
		MemLocation: loc,
	}

	result := pcg.GenerateForInstruction(decoded, stack)
	expected := "ch := 'A'"
	if result != expected {
		t.Errorf("Expected '%s', got '%s'", expected, result)
	}
}

func TestPseudoCodeGeneratorBooleanAssignment(t *testing.T) {
	loc := types.NewLocation(1, nil, nil, nil, "flag", "BOOLEAN")
	labelLookup := map[string]*types.Location{
		loc.String(): loc,
	}

	pcg := NewPseudoCodeGenerator(
		make(map[string]*procedure.ProcIdentifier),
		labelLookup,
	)

	stack := simulator.NewStackSimulator()
	stack.Push("1", "BOOLEAN")

	decoded := &decoder.DecodedInstruction{
		Mnemonic:    "STL",
		MemLocation: loc,
	}

	result := pcg.GenerateForInstruction(decoded, stack)
	expected := "flag := TRUE"
	if result != expected {
		t.Errorf("Expected '%s', got '%s'", expected, result)
	}

	// Test FALSE
	stack.Push("0", "BOOLEAN")
	result = pcg.GenerateForInstruction(decoded, stack)
	expected = "flag := FALSE"
	if result != expected {
		t.Errorf("Expected '%s', got '%s'", expected, result)
	}
}

func TestPseudoCodeGeneratorProcedureCall(t *testing.T) {
	proc1 := 1
	pi := procedure.NewProcIdentifier(
		false, false, 1, nil, 1, strPtr("MyProc"),
		[]types.Identifier{
			types.NewIdentifier("x", "INTEGER"),
			types.NewIdentifier("y", "INTEGER"),
		},
		nil,
	)

	procLookup := map[string]*procedure.ProcIdentifier{
		"1:1": pi,
	}

	pcg := NewPseudoCodeGenerator(procLookup, make(map[string]*types.Location))

	stack := simulator.NewStackSimulator()
	stack.Push("10", "INTEGER")
	stack.Push("20", "INTEGER")

	loc := types.NewLocation(1, &proc1, nil, nil, "", "")
	decoded := &decoder.DecodedInstruction{
		Mnemonic:    "CXP",
		Destination: loc,
	}

	result := pcg.GenerateForInstruction(decoded, stack)
	expected := "SEG1.MyProc(10, 20)"
	if result != expected {
		t.Errorf("Expected '%s', got '%s'", expected, result)
	}
}

func TestPseudoCodeGeneratorFunctionCall(t *testing.T) {
	proc1 := 1
	retType := "INTEGER"
	pi := procedure.NewProcIdentifier(
		true, false, 1, nil, 1, strPtr("MyFunc"),
		[]types.Identifier{
			types.NewIdentifier("x", "INTEGER"),
		},
		&retType,
	)

	procLookup := map[string]*procedure.ProcIdentifier{
		"1:1": pi,
	}

	pcg := NewPseudoCodeGenerator(procLookup, make(map[string]*types.Location))

	stack := simulator.NewStackSimulator()
	stack.Push("retVal1", "")
	stack.Push("retVal2", "")
	stack.Push("42", "INTEGER")

	loc := types.NewLocation(1, &proc1, nil, nil, "", "")
	decoded := &decoder.DecodedInstruction{
		Mnemonic:    "CXP",
		Destination: loc,
	}

	result := pcg.GenerateForInstruction(decoded, stack)
	// Function calls push result onto stack, return empty string
	if result != "" {
		t.Errorf("Expected empty string for function call, got '%s'", result)
	}

	// Check stack has function call
	val, typ := stack.Pop("", false)
	if typ != "INTEGER" {
		t.Errorf("Expected type INTEGER, got %s", typ)
	}
	if !contains(val, "MyFunc") {
		t.Errorf("Expected stack to contain function call, got '%s'", val)
	}
}

func TestSimulateAndGenerateArithmetic(t *testing.T) {
	pcg := NewPseudoCodeGenerator(
		make(map[string]*procedure.ProcIdentifier),
		make(map[string]*types.Location),
	)

	stack := simulator.NewStackSimulator()
	stack.Push("a", "INTEGER")
	stack.Push("b", "INTEGER")

	decoded := &decoder.DecodedInstruction{
		Opcode:   decoder.ADI,
		Mnemonic: "ADI",
	}

	pcg.SimulateAndGenerate(decoder.ADI, decoded, stack)

	result, typ := stack.Pop("", true) // Get without parentheses
	if typ != "INTEGER" {
		t.Errorf("Expected type INTEGER, got %s", typ)
	}
	expected := "a + b"
	if result != expected {
		t.Errorf("Expected '%s', got '%s'", expected, result)
	}
}

func TestSimulateAndGenerateComparison(t *testing.T) {
	pcg := NewPseudoCodeGenerator(
		make(map[string]*procedure.ProcIdentifier),
		make(map[string]*types.Location),
	)

	stack := simulator.NewStackSimulator()
	stack.Push("x", "INTEGER")
	stack.Push("y", "INTEGER")

	decoded := &decoder.DecodedInstruction{
		Opcode:   decoder.GRTI,
		Mnemonic: "GRTI",
	}

	pcg.SimulateAndGenerate(decoder.GRTI, decoded, stack)

	result, typ := stack.Pop("", true) // Get without parentheses
	if typ != "BOOLEAN" {
		t.Errorf("Expected type BOOLEAN, got %s", typ)
	}
	expected := "x > y"
	if result != expected {
		t.Errorf("Expected '%s', got '%s'", expected, result)
	}
}

func TestSimulateAndGenerateLogical(t *testing.T) {
	pcg := NewPseudoCodeGenerator(
		make(map[string]*procedure.ProcIdentifier),
		make(map[string]*types.Location),
	)

	stack := simulator.NewStackSimulator()
	stack.Push("cond1", "BOOLEAN")
	stack.Push("cond2", "BOOLEAN")

	decoded := &decoder.DecodedInstruction{
		Opcode:   decoder.LAND,
		Mnemonic: "LAND",
	}

	pcg.SimulateAndGenerate(decoder.LAND, decoded, stack)

	result, typ := stack.Pop("", true) // Get without parentheses
	if typ != "BOOLEAN" {
		t.Errorf("Expected type BOOLEAN, got %s", typ)
	}
	expected := "cond1 AND cond2"
	if result != expected {
		t.Errorf("Expected '%s', got '%s'", expected, result)
	}
}

// Helper functions
func strPtr(s string) *string {
	return &s
}

func contains(s, substr string) bool {
	return len(s) >= len(substr) && (s == substr || len(s) > len(substr) &&
		(s[:len(substr)] == substr || s[len(s)-len(substr):] == substr ||
			containsInMiddle(s, substr)))
}

func containsInMiddle(s, substr string) bool {
	for i := 0; i <= len(s)-len(substr); i++ {
		if s[i:i+len(substr)] == substr {
			return true
		}
	}
	return false
}
