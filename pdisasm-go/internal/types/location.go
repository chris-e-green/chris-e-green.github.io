package types

import (
	"fmt"
	"strings"
)

type Location struct {
	Segment   int
	Procedure *int
	LexLevel  *int
	Addr      *int
	Name      string
	Type      string
}

func NewLocation(segment int, procedure, lexLevel, addr *int, name, typ string) *Location {
	return &Location{
		Segment:   segment,
		Procedure: procedure,
		LexLevel:  lexLevel,
		Addr:      addr,
		Name:      name,
		Type:      typ,
	}
}

func (l *Location) DispName() string {
	if l.Name != "" {
		return l.Name
	}
	var sb strings.Builder
	fmt.Fprintf(&sb, "S%d", l.Segment)
	if l.Procedure != nil {
		fmt.Fprintf(&sb, "_P%d", *l.Procedure)
	}
	if l.LexLevel != nil {
		fmt.Fprintf(&sb, "_L%d", *l.LexLevel)
	}
	if l.Addr != nil {
		fmt.Fprintf(&sb, "_A%d", *l.Addr)
	}
	return sb.String()
}

func (l *Location) DispType() string {
	if l.Type == "" {
		return "UNKNOWN"
	}
	return l.Type
}

func (l *Location) Key() string {
	var sb strings.Builder
	fmt.Fprintf(&sb, "S%d", l.Segment)
	if l.Procedure != nil {
		fmt.Fprintf(&sb, "_P%d", *l.Procedure)
	}
	if l.LexLevel != nil {
		fmt.Fprintf(&sb, "_L%d", *l.LexLevel)
	}
	if l.Addr != nil {
		fmt.Fprintf(&sb, "_A%d", *l.Addr)
	}
	return sb.String()
}

func (l *Location) String() string {
	if l.Name != "" {
		return fmt.Sprintf("%s:%s", l.Name, l.Type)
	}
	return l.Key()
}

func (l *Location) LongDescription() string {
	var sb strings.Builder
	fmt.Fprintf(&sb, "S%d", l.Segment)
	if l.Procedure != nil {
		fmt.Fprintf(&sb, "_P%d", *l.Procedure)
	}
	if l.LexLevel != nil {
		fmt.Fprintf(&sb, "_L%d", *l.LexLevel)
	}
	if l.Addr != nil {
		fmt.Fprintf(&sb, "_A%d", *l.Addr)
	}
	if l.Name != "" {
		fmt.Fprintf(&sb, "_%s:%s", l.Name, l.Type)
	}
	return sb.String()
}

func (l *Location) Less(other *Location) bool {
	if l.Segment != other.Segment {
		return l.Segment < other.Segment
	}
	lp := -1
	if l.Procedure != nil {
		lp = *l.Procedure
	}
	op := -1
	if other.Procedure != nil {
		op = *other.Procedure
	}
	if lp != op {
		return lp < op
	}
	ll := -1
	if l.LexLevel != nil {
		ll = *l.LexLevel
	}
	ol := -1
	if other.LexLevel != nil {
		ol = *other.LexLevel
	}
	if ll != ol {
		return ll < ol
	}
	la := -1
	if l.Addr != nil {
		la = *l.Addr
	}
	oa := -1
	if other.Addr != nil {
		oa = *other.Addr
	}
	return la < oa
}
