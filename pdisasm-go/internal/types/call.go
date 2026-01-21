package types

import "fmt"

type Call struct {
	Origin *Location
	Target *Location
}

func NewCall(from, to *Location) *Call {
	return &Call{Origin: from, Target: to}
}

func (c *Call) String() string {
	return fmt.Sprintf("From %s to %s", c.Origin.String(), c.Target.String())
}
