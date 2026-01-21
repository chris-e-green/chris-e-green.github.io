package types

import "fmt"

type Identifier struct {
	Name string
	Type string
}

func NewIdentifier(name, typ string) Identifier {
	return Identifier{Name: name, Type: typ}
}

func (i Identifier) String() string {
	if i.Type == "" {
		return i.Name
	}
	return fmt.Sprintf("%s:%s", i.Name, i.Type)
}
