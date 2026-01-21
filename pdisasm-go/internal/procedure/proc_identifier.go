package procedure

import (
	"fmt"
	"strings"

	"pdisasm-go/internal/types"
)

type ProcIdentifier struct {
	IsFunction  bool
	IsAssembly  bool
	Segment     int
	SegmentName *string
	Procedure   int
	ProcName    *string
	Parameters  []types.Identifier
	ReturnType  *string
}

func NewProcIdentifier(isFunction, isAssembly bool, segment int, segmentName *string, procedure int, procName *string, parameters []types.Identifier, returnType *string) *ProcIdentifier {
	pi := &ProcIdentifier{
		IsFunction:  isFunction,
		IsAssembly:  isAssembly,
		Segment:     segment,
		SegmentName: segmentName,
		Procedure:   procedure,
		ProcName:    procName,
		Parameters:  parameters,
	}
	if isFunction {
		if returnType == nil {
			unknown := "UNKNOWN"
			pi.ReturnType = &unknown
		} else {
			pi.ReturnType = returnType
		}
	}
	return pi
}

func (pi *ProcIdentifier) String() string {
	var sb strings.Builder
	if pi.IsFunction {
		sb.WriteString("FUNCTION ")
	} else {
		sb.WriteString("PROCEDURE ")
	}

	if pi.SegmentName != nil && *pi.SegmentName != "" {
		sb.WriteString(*pi.SegmentName)
	} else {
		fmt.Fprintf(&sb, "SEG%d", pi.Segment)
	}
	sb.WriteString(".")

	if pi.ProcName != nil && *pi.ProcName != "" {
		sb.WriteString(*pi.ProcName)
	} else {
		if pi.IsFunction {
			fmt.Fprintf(&sb, "FUNC%d", pi.Procedure)
		} else {
			fmt.Fprintf(&sb, "PROC%d", pi.Procedure)
		}
	}

	if len(pi.Parameters) > 0 {
		sb.WriteString("(")
		for i, param := range pi.Parameters {
			if i > 0 {
				sb.WriteString("; ")
			}
			sb.WriteString(param.String())
		}
		sb.WriteString(")")
	}

	if pi.IsFunction && pi.ReturnType != nil {
		sb.WriteString(": ")
		sb.WriteString(*pi.ReturnType)
	}

	return sb.String()
}

func (pi *ProcIdentifier) ShortDescription() string {
	var sb strings.Builder
	if pi.SegmentName == nil || *pi.SegmentName == "" {
		fmt.Fprintf(&sb, "SEG%d", pi.Segment)
	} else {
		sb.WriteString(*pi.SegmentName)
	}
	sb.WriteString(".")
	if pi.ProcName == nil || *pi.ProcName == "" {
		if pi.IsFunction {
			fmt.Fprintf(&sb, "FUNC%d", pi.Procedure)
		} else {
			fmt.Fprintf(&sb, "PROC%d", pi.Procedure)
		}
	} else {
		sb.WriteString(*pi.ProcName)
	}
	return sb.String()
}
