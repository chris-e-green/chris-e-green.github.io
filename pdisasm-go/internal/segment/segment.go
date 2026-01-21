package segment

import "fmt"

type SegmentKind int

const (
	Linked SegmentKind = iota
	Hostseg
	Segproc
	Unitseg
	Seprtseg
	UnlinkedIntrins
	LinkedIntrins
	Dataseg
)

func (sk SegmentKind) String() string {
	names := []string{"linked", "hostseg", "segproc", "unitseg", "seprtseg", "unlinked_intrins", "linked_intrins", "dataseg"}
	if int(sk) < len(names) {
		return names[sk]
	}
	return fmt.Sprintf("SegmentKind(%d)", sk)
}

type Segment struct {
	Codeaddr int
	Codeleng int
	Name     string
	Segkind  SegmentKind
	Textaddr int
	SegNum   int
	MType    int
	Version  int
}

func NewSegment(codeaddr, codeleng int, name string, segkind SegmentKind, textaddr, segNum, mType, version int) *Segment {
	return &Segment{
		Codeaddr: codeaddr,
		Codeleng: codeleng,
		Name:     name,
		Segkind:  segkind,
		Textaddr: textaddr,
		SegNum:   segNum,
		MType:    mType,
		Version:  version,
	}
}

func (s *Segment) String() string {
	return fmt.Sprintf("Segment(name: \"%s\", codeaddr: %04X, len: %d)", s.Name, s.Codeaddr, s.Codeleng)
}
