package segment

import (
	"fmt"
	"sort"
	"strings"
)

type SegDictionary struct {
	SegTable   map[int]*Segment
	Intrinsics map[uint8]bool
	Comment    string
}

func NewSegDictionary(segTable map[int]*Segment, intrinsics map[uint8]bool, comment string) *SegDictionary {
	return &SegDictionary{
		SegTable:   segTable,
		Intrinsics: intrinsics,
		Comment:    comment,
	}
}

func (sd *SegDictionary) String() string {
	var sb strings.Builder
	sb.WriteString("## Segment Table\n\n")
	sb.WriteString("| slot | segNum | name | codeaddr | codeleng | kind | textAddr | mType | version |\n")
	sb.WriteString("|-----:|-------:|------|---------:|---------:|------|---------:|-------|--------:|\n")

	type entry struct {
		slot    int
		segment *Segment
	}
	var entries []entry
	for slot, seg := range sd.SegTable {
		entries = append(entries, entry{slot, seg})
	}
	sort.Slice(entries, func(i, j int) bool {
		return entries[i].segment.Codeaddr < entries[j].segment.Codeaddr
	})

	for _, e := range entries {
		fmt.Fprintf(&sb, "| %d | %d | %s | %04X | %d | %s | %04X | %d | %d |\n",
			e.slot, e.segment.SegNum, e.segment.Name, e.segment.Codeaddr,
			e.segment.Codeleng, e.segment.Segkind, e.segment.Textaddr,
			e.segment.MType, e.segment.Version)
	}

	sb.WriteString("\nintrinsics: `")
	var intrList []uint8
	for intr := range sd.Intrinsics {
		intrList = append(intrList, intr)
	}
	sort.Slice(intrList, func(i, j int) bool { return intrList[i] < intrList[j] })
	for i, intr := range intrList {
		if i > 0 {
			sb.WriteString(", ")
		}
		fmt.Fprintf(&sb, "%d", intr)
	}
	sb.WriteString("`\n\n")
	sb.WriteString("comment: " + sd.Comment + "\n")

	return sb.String()
}
