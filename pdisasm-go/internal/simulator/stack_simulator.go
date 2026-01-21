package simulator

import (
	"fmt"
	"strconv"
	"strings"
)

type StackSimulator struct {
	Sep   rune
	Stack []string
}

func NewStackSimulator() *StackSimulator {
	return &StackSimulator{
		Sep:   '~',
		Stack: []string{},
	}
}

func (ss *StackSimulator) Push(value, typ string) {
	t := typ
	if t == "" {
		t = "UNKNOWN"
	}
	ss.Stack = append(ss.Stack, value+string(ss.Sep)+t)
}

func (ss *StackSimulator) PushReal(value string) {
	ss.Stack = append(ss.Stack, value+string(ss.Sep)+"REAL")
}

func (ss *StackSimulator) Pop(typ string, withoutParentheses bool) (string, string) {
	if len(ss.Stack) == 0 {
		return "underflow!", ""
	}

	a := ss.Stack[len(ss.Stack)-1]
	ss.Stack = ss.Stack[:len(ss.Stack)-1]

	var parenthesized string
	var locType string

	if strings.Contains(a, string(ss.Sep)) {
		parts := strings.SplitN(a, string(ss.Sep), 2)
		locName := parts[0]
		locType = parts[1]
		if locType == "UNKNOWN" {
			locType = typ
		}
		if withoutParentheses {
			parenthesized = locName
		} else {
			if strings.Contains(locName, " ") && locType != "STRING" {
				parenthesized = "(" + locName + ")"
			} else {
				parenthesized = locName
			}
		}
	} else {
		if withoutParentheses {
			parenthesized = a
		} else {
			if strings.Contains(a, " ") {
				parenthesized = "(" + a + ")"
			} else {
				parenthesized = a
			}
		}
		locType = typ
	}

	return parenthesized, locType
}

func (ss *StackSimulator) PopUntyped(withoutParentheses bool) (string, string) {
	if len(ss.Stack) == 0 {
		return "underflow!", ""
	}

	a := ss.Stack[len(ss.Stack)-1]
	ss.Stack = ss.Stack[:len(ss.Stack)-1]

	if strings.Contains(a, string(ss.Sep)) {
		parts := strings.SplitN(a, string(ss.Sep), 2)
		if withoutParentheses {
			return parts[0], parts[1]
		}
		parenthesized := parts[0]
		if strings.Contains(parts[0], " ") && parts[1] != "STRING" {
			parenthesized = "(" + parts[0] + ")"
		}
		return parenthesized, parts[1]
	}

	if withoutParentheses {
		return a, ""
	}
	parenthesized := a
	if strings.Contains(a, " ") {
		parenthesized = "(" + a + ")"
	}
	return parenthesized, ""
}

func (ss *StackSimulator) PopReal() (string, string) {
	if len(ss.Stack) == 0 {
		return "underflow!", ""
	}

	a := ss.Stack[len(ss.Stack)-1]
	ss.Stack = ss.Stack[:len(ss.Stack)-1]

	if strings.Contains(a, string(ss.Sep)) {
		parts := strings.SplitN(a, string(ss.Sep), 2)
		return parts[0], parts[1]
	}

	// Two-word real representation
	if len(ss.Stack) == 0 {
		return a, "REAL"
	}
	b := ss.Stack[len(ss.Stack)-1]
	ss.Stack = ss.Stack[:len(ss.Stack)-1]

	val1, err1 := strconv.ParseUint(a, 10, 16)
	val2, err2 := strconv.ParseUint(b, 10, 16)
	if err1 == nil && err2 == nil {
		fraction := uint32(val1) | ((uint32(val2) & 0x007f) << 16)
		exponent := (val2 & 0x7f80) >> 7
		sign := (val2 & 0x8000) == 0x8000
		signStr := ""
		if sign {
			signStr = "-"
		}
		return fmt.Sprintf("%s%de%d", signStr, fraction, exponent), "REAL"
	}
	return fmt.Sprintf("%s.%s", a, b), "REAL"
}

func (ss *StackSimulator) PopSet() (int, string) {
	setLen, _ := ss.PopUntyped(false)
	var setData []string
	var setVals []int

	length, err := strconv.Atoi(setLen)
	if err != nil {
		return 0, "malformed set!"
	}

	prevElement := ""
	for i := 0; i < length; i++ {
		element, _ := ss.PopUntyped(false)
		if !strings.Contains(element, "{") {
			if value, err := strconv.ParseUint(element, 10, 64); err == nil {
				for j := 0; j < 16; j++ {
					if (value>>j)&1 == 1 {
						setVals = append(setVals, i*16+j)
					}
				}
			} else {
				setData = append(setData, element)
			}
		} else {
			parts := strings.Split(element, "{")
			if parts[0] != prevElement {
				prevElement = parts[0]
				setData = append(setData, parts[0])
			}
		}
	}

	if len(setVals) > 0 {
		// Group consecutive values
		i := 0
		for i < len(setVals) {
			start := setVals[i]
			end := start
			for i+1 < len(setVals) && setVals[i+1] == end+1 {
				i++
				end = setVals[i]
			}
			if start == end {
				setData = append(setData, fmt.Sprintf("%d", start))
			} else {
				setData = append(setData, fmt.Sprintf("%d...%d", start, end))
			}
			i++
		}
	}

	return length, "[" + strings.Join(setData, ", ") + "]"
}

func (ss *StackSimulator) Snapshot() []string {
	snapshot := make([]string, len(ss.Stack))
	copy(snapshot, ss.Stack)
	return snapshot
}
