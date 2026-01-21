package simulator

import (
	"testing"
)

func TestStackSimulatorBasic(t *testing.T) {
	ss := NewStackSimulator()

	// Test push
	ss.Push("value1", "INTEGER")
	ss.Push("value2", "STRING")

	if len(ss.Stack) != 2 {
		t.Errorf("Expected stack length 2, got %d", len(ss.Stack))
	}

	// Test pop
	val, typ := ss.Pop("", false)
	if val != "value2" || typ != "STRING" {
		t.Errorf("Expected (value2, STRING), got (%s, %s)", val, typ)
	}

	val, typ = ss.Pop("", false)
	if val != "value1" || typ != "INTEGER" {
		t.Errorf("Expected (value1, INTEGER), got (%s, %s)", val, typ)
	}
}

func TestStackSimulatorUnknownType(t *testing.T) {
	ss := NewStackSimulator()

	ss.Push("val", "")
	val, typ := ss.Pop("REAL", false)

	if typ != "REAL" {
		t.Errorf("Expected type inference to REAL, got %s", typ)
	}
	if val != "val" {
		t.Errorf("Expected value val, got %s", val)
	}
}

func TestStackSimulatorParentheses(t *testing.T) {
	ss := NewStackSimulator()

	ss.Push("a + b", "INTEGER")

	// Without parentheses
	val, _ := ss.Pop("", true)
	if val != "a + b" {
		t.Errorf("Expected 'a + b' without parens, got %s", val)
	}

	// With parentheses
	ss.Push("a + b", "INTEGER")
	val, _ = ss.Pop("", false)
	if val != "(a + b)" {
		t.Errorf("Expected '(a + b)' with parens, got %s", val)
	}
}

func TestStackSimulatorSnapshot(t *testing.T) {
	ss := NewStackSimulator()

	ss.Push("val1", "INTEGER")
	ss.Push("val2", "STRING")

	snapshot := ss.Snapshot()

	if len(snapshot) != 2 {
		t.Errorf("Expected snapshot length 2, got %d", len(snapshot))
	}

	// Modify original
	ss.Pop("", false)

	// Snapshot should be unchanged
	if len(snapshot) != 2 {
		t.Errorf("Snapshot was modified")
	}
}

func TestMachineBasicOps(t *testing.T) {
	m := NewMachine()

	// Test push/pop
	m.Push(42)
	m.Push(10)

	val, err := m.Pop()
	if err != nil || val != 10 {
		t.Errorf("Expected 10, got %d, err: %v", val, err)
	}

	val, err = m.Pop()
	if err != nil || val != 42 {
		t.Errorf("Expected 42, got %d, err: %v", val, err)
	}
}

func TestMachineArithmetic(t *testing.T) {
	m := NewMachine()

	instructions := []SimInsn{
		{IC: 0, Mnemonic: "SLDC", Args: []int{10}},
		{IC: 1, Mnemonic: "SLDC", Args: []int{5}},
		{IC: 2, Mnemonic: "ADI", Args: []int{}},
	}

	result, err := m.Execute(instructions, 0, 100)
	if err != nil {
		t.Fatalf("Execute failed: %v", err)
	}

	if len(result.Stack) != 1 {
		t.Fatalf("Expected stack length 1, got %d", len(result.Stack))
	}

	if result.Stack[0] != 15 {
		t.Errorf("Expected result 15, got %d", result.Stack[0])
	}

	if len(result.Trace) != 3 {
		t.Errorf("Expected 3 trace entries, got %d", len(result.Trace))
	}
}

func TestMachineComparison(t *testing.T) {
	m := NewMachine()

	instructions := []SimInsn{
		{IC: 0, Mnemonic: "SLDC", Args: []int{10}},
		{IC: 1, Mnemonic: "SLDC", Args: []int{5}},
		{IC: 2, Mnemonic: "GRTI", Args: []int{}},
	}

	result, err := m.Execute(instructions, 0, 100)
	if err != nil {
		t.Fatalf("Execute failed: %v", err)
	}

	if len(result.Stack) != 1 {
		t.Fatalf("Expected stack length 1, got %d", len(result.Stack))
	}

	// 10 > 5 should be true (1)
	if result.Stack[0] != 1 {
		t.Errorf("Expected result 1 (true), got %d", result.Stack[0])
	}
}

func TestMachineJump(t *testing.T) {
	m := NewMachine()

	instructions := []SimInsn{
		{IC: 0, Mnemonic: "SLDC", Args: []int{1}},
		{IC: 1, Mnemonic: "FJP", Args: []int{5}},   // Jump to IC 5 if false
		{IC: 2, Mnemonic: "SLDC", Args: []int{99}}, // Should be skipped
		{IC: 5, Mnemonic: "SLDC", Args: []int{42}},
	}

	result, err := m.Execute(instructions, 0, 100)
	if err != nil {
		t.Fatalf("Execute failed: %v", err)
	}

	// Stack should have: 1 (from first SLDC), 42 (from jump target)
	if len(result.Stack) != 2 {
		t.Fatalf("Expected stack length 2, got %d", len(result.Stack))
	}

	if result.Stack[1] != 42 {
		t.Errorf("Expected top of stack to be 42, got %d", result.Stack[1])
	}
}

func TestMachineMemory(t *testing.T) {
	m := NewMachine()

	instructions := []SimInsn{
		{IC: 0, Mnemonic: "SLDC", Args: []int{100}}, // Value
		{IC: 1, Mnemonic: "STL", Args: []int{1000}}, // Store at addr 1000
		{IC: 2, Mnemonic: "LDL", Args: []int{1000}}, // Load from addr 1000
	}

	result, err := m.Execute(instructions, 0, 100)
	if err != nil {
		t.Fatalf("Execute failed: %v", err)
	}

	if len(result.Stack) != 1 {
		t.Fatalf("Expected stack length 1, got %d", len(result.Stack))
	}

	if result.Stack[0] != 100 {
		t.Errorf("Expected loaded value 100, got %d", result.Stack[0])
	}

	if result.Memory[1000] != 100 {
		t.Errorf("Expected memory[1000] = 100, got %d", result.Memory[1000])
	}
}

func TestMachineFrames(t *testing.T) {
	m := NewMachine()

	// Enter a frame
	id1 := m.EnterFrame(0)
	if id1 != 1 {
		t.Errorf("Expected frame ID 1, got %d", id1)
	}

	if m.MP == nil || *m.MP != 0x1000 {
		t.Errorf("Expected MP = 0x1000, got %v", m.MP)
	}

	// Enter another frame
	id2 := m.EnterFrame(0)
	if id2 != 2 {
		t.Errorf("Expected frame ID 2, got %d", id2)
	}

	// Pop frame
	popped := m.PopFrame()
	if popped == nil || *popped != 2 {
		t.Errorf("Expected popped frame ID 2, got %v", popped)
	}

	// MP should be restored
	if m.MP == nil || *m.MP != 0x1000 {
		t.Errorf("Expected MP restored to 0x1000, got %v", m.MP)
	}
}
