package types

type CodeDataError struct {
	Message string
}

func (e *CodeDataError) Error() string {
	return e.Message
}

type CodeData struct {
	Data   []byte
	IPC    int
	Header int
}

func NewCodeData(data []byte, ipc, header int) *CodeData {
	return &CodeData{
		Data:   data,
		IPC:    ipc,
		Header: header,
	}
}

func (cd *CodeData) ReadByte() (byte, error) {
	if cd.IPC >= len(cd.Data) {
		return 0, &CodeDataError{"unexpected end of data"}
	}
	retval := cd.Data[cd.IPC]
	cd.IPC++
	return retval, nil
}

func (cd *CodeData) ReadBig() (int, error) {
	firstByte, err := cd.ReadByte()
	if err != nil {
		return 0, err
	}

	if firstByte <= 127 {
		return int(firstByte), nil
	}

	if cd.IPC >= len(cd.Data) {
		return 0, &CodeDataError{"unexpected end of data"}
	}
	high := int(firstByte & 0x7F)
	low := cd.Data[cd.IPC]
	cd.IPC++
	return (high << 8) | int(low), nil
}

func (cd *CodeData) ReadWord() (uint16, error) {
	if cd.IPC+1 >= len(cd.Data) {
		return 0, &CodeDataError{"unexpected end of data"}
	}
	low := uint16(cd.Data[cd.IPC])
	high := uint16(cd.Data[cd.IPC+1])
	cd.IPC += 2
	return (high << 8) | low, nil
}

func (cd *CodeData) ReadWordAt(position int) (uint16, error) {
	if position < 0 || position+1 >= len(cd.Data) {
		return 0, &CodeDataError{"unexpected end of data"}
	}
	low := uint16(cd.Data[position])
	high := uint16(cd.Data[position+1])
	return (high << 8) | low, nil
}

func (cd *CodeData) ReadByteAt(position int) (byte, error) {
	if position < 0 || position >= len(cd.Data) {
		return 0, &CodeDataError{"unexpected end of data"}
	}
	return cd.Data[position], nil
}

func (cd *CodeData) ReadBigAt(position int) (int, int, error) {
	if position < 0 || position >= len(cd.Data) {
		return 0, 0, &CodeDataError{"unexpected end of data"}
	}
	first := cd.Data[position]
	if first <= 127 {
		return int(first), 1, nil
	}
	if position+1 >= len(cd.Data) {
		return 0, 0, &CodeDataError{"unexpected end of data"}
	}
	val := int(first&0x7F)<<8 | int(cd.Data[position+1])
	return val, 2, nil
}

func (cd *CodeData) GetSelfRefPointer(position int) (int, error) {
	w, err := cd.ReadWordAt(position)
	if err != nil {
		return 0, err
	}
	return position - int(w), nil
}

func (cd *CodeData) ReadAddress() (int, error) {
	offset, err := cd.ReadByte()
	if err != nil {
		return 0, err
	}

	if offset > 0x7F {
		jte := cd.Header + int(offset) - 256
		jumpTableEntry, err := cd.ReadWordAt(jte)
		if err != nil {
			return 0, err
		}
		return jte - int(jumpTableEntry), nil
	}
	return cd.IPC + int(offset) + 1, nil
}

func (cd *CodeData) ReadString() (string, error) {
	count, err := cd.ReadByte()
	if err != nil {
		return "", err
	}

	if cd.IPC+int(count) > len(cd.Data) {
		return "", &CodeDataError{"unexpected end of data"}
	}

	stringData := cd.Data[cd.IPC : cd.IPC+int(count)]
	cd.IPC += int(count)
	return string(stringData), nil
}

func (cd *CodeData) ReadByteArray() ([]byte, error) {
	count, err := cd.ReadByte()
	if err != nil {
		return nil, err
	}

	if cd.IPC+int(count) > len(cd.Data) {
		return nil, &CodeDataError{"unexpected end of data"}
	}

	byteArray := make([]byte, count)
	copy(byteArray, cd.Data[cd.IPC:cd.IPC+int(count)])
	cd.IPC += int(count)
	return byteArray, nil
}

func (cd *CodeData) ReadWordArray(count int) ([]uint16, error) {
	if cd.IPC+(count*2) > len(cd.Data) {
		return nil, &CodeDataError{"unexpected end of data"}
	}

	words := make([]uint16, 0, count)
	for i := 0; i < count; i++ {
		word, err := cd.ReadWord()
		if err != nil {
			return nil, err
		}
		words = append(words, word)
	}
	return words, nil
}

func (cd *CodeData) GetCodeBlock(blockNum, length int) []byte {
	start := blockNum * 512
	end := start + length
	if start < 0 || end > len(cd.Data) {
		return []byte{}
	}
	block := make([]byte, length)
	copy(block, cd.Data[start:end])
	return block
}
