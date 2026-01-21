package pdisasm

import (
	"encoding/csv"
	"encoding/json"
	"fmt"
	"os"
	"path/filepath"
	"sort"
	"strings"

	"pdisasm-go/internal/arch"
	"pdisasm-go/internal/codegen"
	"pdisasm-go/internal/decoder"
	"pdisasm-go/internal/procedure"
	"pdisasm-go/internal/segment"
	"pdisasm-go/internal/simulator"
	"pdisasm-go/internal/types"
)

// RunPdisasm runs the disassembler on the given file
func RunPdisasm(filename string, verbose bool, rewrite bool, metadataPrefix string) error {
	// Load binary file
	data, err := os.ReadFile(filename)
	if err != nil {
		return fmt.Errorf("failed to read file: %w", err)
	}

	binaryData := types.NewCodeData(data, 0, 0)

	// Parse segment dictionary
	segDict, err := readCodeFileStructure(binaryData)
	if err != nil {
		return fmt.Errorf("failed to read code file structure: %w", err)
	}

	// Initialize data structures
	allCodeSegs := make(map[int]*segment.CodeSegment)
	allLocations := make(map[string]*types.Location)
	var allProcedures []*procedure.ProcIdentifier
	allCallers := make(map[string]*types.Call)

	// Load metadata
	fileIdentifier := strings.TrimSuffix(filepath.Base(filename), filepath.Ext(filename))
	version := 0
	if seg1, ok := segDict.SegTable[1]; ok {
		version = seg1.Version
	}

	allLabelsCSVFile := fmt.Sprintf("labels_%s.csv", fileIdentifier)
	sysLabelsCSVFile := fmt.Sprintf("labels_ver_%d.csv", version)
	allProceduresCSVFile := fmt.Sprintf("procedures_%s.csv", fileIdentifier)
	sysProceduresCSVFile := fmt.Sprintf("procedures_ver_%d.csv", version)
	globalsFile := fmt.Sprintf("globals_ver_%d.json", version)

	// Load labels
	importLabels(filepath.Join(metadataPrefix, allLabelsCSVFile), allLocations)
	importLabels(filepath.Join(metadataPrefix, sysLabelsCSVFile), allLocations)

	// Load global names
	globalNames := make(map[int]types.Identifier)
	importGlobalLabels(filepath.Join(metadataPrefix, globalsFile), globalNames)

	// Load procedures
	var sysProcs []*procedure.ProcIdentifier
	importProcedures(filepath.Join(metadataPrefix, allProceduresCSVFile), &allProcedures)
	importProcedures(filepath.Join(metadataPrefix, sysProceduresCSVFile), &sysProcs)
	allProcedures = append(allProcedures, sysProcs...)

	// Process each segment
	segKeys := make([]int, 0, len(segDict.SegTable))
	for k := range segDict.SegTable {
		segKeys = append(segKeys, k)
	}
	sort.Ints(segKeys)

	for _, segKey := range segKeys {
		seg := segDict.SegTable[segKey]
		code := binaryData.GetCodeBlock(seg.Codeaddr, seg.Codeleng)

		if len(code) < 2 {
			if verbose {
				fmt.Printf("Skipping segment %s (segNum=%d): code block too small (len=%d)\n",
					seg.Name, seg.SegNum, len(code))
			}
			continue
		}

		// Handle PASCALSY special case (segments 0 and 15)
		var extraCode []byte
		offset := 0
		if seg.SegNum == 0 && seg.Name == "PASCALSY" {
			if extraSeg, ok := segDict.SegTable[15]; ok {
				extraCode = binaryData.GetCodeBlock(extraSeg.Codeaddr, extraSeg.Codeleng)
				// Calculate offset for negative addresses
				pascalProcCount := int(code[len(code)-1])
				lastProcHdrLoc := len(code) - 2 - pascalProcCount*2
				cdForLast := types.NewCodeData(code, 0, 0)
				lastProcRelativeAddr, _ := cdForLast.ReadWordAt(lastProcHdrLoc)
				lastProcAbsAddr := int(lastProcRelativeAddr) - lastProcHdrLoc
				offset = lastProcAbsAddr + len(extraCode) - 2
			}
		}
		if seg.SegNum == 15 && strings.TrimSpace(seg.Name) == "" {
			continue // Skip hidden part of PASCALSY
		}

		// Create code segment
		codeSeg := segment.NewCodeSegment(
			procedure.NewProcedureDictionary(
				int(code[len(code)-2]),
				int(code[len(code)-1]),
				[]int{},
			),
			[]*procedure.Procedure{},
		)

		// Extract procedure pointers
		cdForPtrs := types.NewCodeData(code, 0, 0)
		for i := 1; i <= codeSeg.ProcedureDictionary.ProcedureCount; i++ {
			ptrLoc := len(code) - i*2 - 2
			ptr, err := cdForPtrs.GetSelfRefPointer(ptrLoc)
			if err != nil {
				codeSeg.ProcedureDictionary.ProcedurePointers = append(
					codeSeg.ProcedureDictionary.ProcedurePointers, 0)
			} else {
				codeSeg.ProcedureDictionary.ProcedurePointers = append(
					codeSeg.ProcedureDictionary.ProcedurePointers, ptr)
			}
		}

		// Decode each procedure
		for procIdx, procPtr := range codeSeg.ProcedureDictionary.ProcedurePointers {
			proc := procedure.NewProcedure()
			var inCode []byte
			addr := procPtr

			if addr < 0 {
				inCode = extraCode
				addr = addr + offset
			} else {
				inCode = code
			}

			// Validate bounds
			minNeeded := addr - 8
			maxNeeded := addr + 1
			if minNeeded < 0 || maxNeeded >= len(inCode) {
				if verbose {
					fmt.Printf("Skipping procedure at index %d: pointer out of range (addr=%d, code.len=%d)\n",
						procIdx+1, addr, len(inCode))
				}
				continue
			}

			procNumber := 0
			isAssembler := false
			if addr >= 0 && addr < len(inCode) {
				procNumber = int(inCode[addr])
			}

			if procNumber == 0 && seg.MType == 7 {
				procNumber = procIdx + 1
				isAssembler = true
			}

			// Find predefined proc
			for _, predefinedProc := range allProcedures {
				if predefinedProc.Segment == seg.SegNum && predefinedProc.Procedure == procNumber {
					proc.ProcType = predefinedProc
					break
				}
			}

			if isAssembler && seg.MType == 7 {
				err := arch.DecodeAssemblerProcedure(proc, inCode, addr)
				if err != nil && verbose {
					fmt.Printf("Error decoding assembler procedure %d: %v\n", procNumber, err)
				}
			} else {
				err := decodePascalProcedureEnhanced(seg, procNumber, proc, inCode, addr,
					allCallers, allLocations, allProcedures, verbose)
				if err != nil && verbose {
					fmt.Printf("Error decoding procedure %d: %v\n", procNumber, err)
				}
			}

			codeSeg.Procedures = append(codeSeg.Procedures, proc)
		}

		allCodeSegs[seg.SegNum] = codeSeg
	}

	// Output results
	outputResults(fileIdentifier, segDict, allCodeSegs, allLocations, allProcedures, allCallers)

	// Export labels and procedures if rewrite enabled
	if rewrite {
		err := exportLabels(filepath.Join(metadataPrefix, allLabelsCSVFile), allLocations, false)
		if err != nil {
			return err
		}
		err = exportLabels(filepath.Join(metadataPrefix, sysLabelsCSVFile), allLocations, true)
		if err != nil {
			return err
		}
		err = exportProcedures(filepath.Join(metadataPrefix, allProceduresCSVFile), allProcedures, false)
		if err != nil {
			return err
		}
		err = exportProcedures(filepath.Join(metadataPrefix, sysProceduresCSVFile), allProcedures, true)
		if err != nil {
			return err
		}
	}

	return nil
}

func readCodeFileStructure(codeData *types.CodeData) (*segment.SegDictionary, error) {
	if len(codeData.Data) < 512 {
		return nil, fmt.Errorf("code file too small: %d bytes", len(codeData.Data))
	}

	diskInfo := types.NewCodeData(codeData.Data[0:64], 0, 0)
	segName := types.NewCodeData(codeData.Data[64:192], 0, 0)
	segKind := types.NewCodeData(codeData.Data[192:224], 0, 0)
	textAddr := types.NewCodeData(codeData.Data[224:256], 0, 0)
	segInfo := types.NewCodeData(codeData.Data[256:288], 0, 0)
	intrinsSegs := types.NewCodeData(codeData.Data[288:296], 0, 0)
	comment := types.NewCodeData(codeData.Data[433:512], 0, 0)

	segTable := make(map[int]*segment.Segment)

	for segIdx := 0; segIdx <= 15; segIdx++ {
		codeaddr, err := diskInfo.ReadWordAt(segIdx * 4)
		if err != nil {
			continue
		}
		codeleng, err := diskInfo.ReadWordAt(segIdx*4 + 2)
		if err != nil {
			continue
		}

		name := ""
		for j := 0; j < 8; j++ {
			b, err := segName.ReadByteAt(segIdx*8 + j)
			if err == nil {
				name += string(b)
			}
		}
		name = strings.TrimSpace(name)

		kindWord, _ := segKind.ReadWordAt(segIdx * 2)
		kind := segment.SegmentKind(kindWord)

		segNum, _ := segInfo.ReadByteAt(segIdx * 2)
		if segNum == 0 {
			segNum = byte(segIdx)
		}

		infoByte, _ := segInfo.ReadByteAt(segIdx*2 + 1)
		mType := int(infoByte & 0x0F)
		version := int((infoByte & 0xE0) >> 5)

		text, _ := textAddr.ReadWordAt(segIdx * 2)

		if codeleng > 0 {
			segTable[segIdx] = segment.NewSegment(
				int(codeaddr), int(codeleng), name, kind,
				int(text), int(segNum), mType, version)
		}
	}

	// Parse intrinsics
	intrinsicSet := make(map[uint8]bool)
	for i := len(intrinsSegs.Data) - 1; i >= 0; i-- {
		value := intrinsSegs.Data[i]
		for j := 0; j < 8; j++ {
			if (value>>j)&1 == 1 {
				intrinsicSet[uint8(i*8+j)] = true
			}
		}
	}

	commentStr := string(comment.Data)
	commentStr = strings.TrimRight(commentStr, "\x00")

	return segment.NewSegDictionary(segTable, intrinsicSet, commentStr), nil
}

func importLabels(csvFile string, locations map[string]*types.Location) {
	if _, err := os.Stat(csvFile); os.IsNotExist(err) {
		return
	}

	f, err := os.Open(csvFile)
	if err != nil {
		return
	}
	defer func(f *os.File) {
		err := f.Close()
		if err != nil {
			fmt.Printf("Error closing file: %v\n", err)
		}
	}(f)

	r := csv.NewReader(f)
	records, err := r.ReadAll()
	if err != nil {
		return
	}

	// Skip header
	for i, record := range records {
		if i == 0 {
			continue
		}
		if len(record) < 6 {
			continue
		}

		var seg, proc, lexLevel, addr int
		_, err := fmt.Sscanf(record[0], "%d", &seg)
		if err != nil {
			return
		}
		if record[1] != "" {
			_, err := fmt.Sscanf(record[1], "%d", &proc)
			if err != nil {
				return
			}
		}
		if record[2] != "" {
			_, err := fmt.Sscanf(record[2], "%d", &lexLevel)
			if err != nil {
				return
			}
		}
		if record[3] != "" {
			_, err := fmt.Sscanf(record[3], "%d", &addr)
			if err != nil {
				return
			}
		}

		var procPtr, lexLevelPtr, addrPtr *int
		if record[1] != "" {
			procPtr = &proc
		}
		if record[2] != "" {
			lexLevelPtr = &lexLevel
		}
		if record[3] != "" {
			addrPtr = &addr
		}

		loc := types.NewLocation(seg, procPtr, lexLevelPtr, addrPtr, record[4], record[5])
		key := loc.String()
		locations[key] = loc
	}
}

func exportLabels(csvFile string, locations map[string]*types.Location, sysOnly bool) error {
	// Create backup
	if _, err := os.Stat(csvFile); err == nil {
		backupFile := csvFile + ".bak"
		err := os.Remove(backupFile)
		if err != nil {
			return err
		}
		err = os.Rename(csvFile, backupFile)
		if err != nil {
			return err
		}
	}

	f, err := os.Create(csvFile)
	if err != nil {
		return err
	}
	defer func(f *os.File) {
		err := f.Close()
		if err != nil {

		}
	}(f)

	w := csv.NewWriter(f)
	defer w.Flush()

	// Write header
	err = w.Write([]string{"segment", "procedure", "lexLevel", "addr", "name", "type"})
	if err != nil {
		return err
	}

	// Sort and filter locations
	var locs []*types.Location
	for _, loc := range locations {
		if sysOnly && loc.Segment != 0 {
			continue
		}
		if !sysOnly && loc.Segment == 0 {
			continue
		}
		locs = append(locs, loc)
	}

	sort.Slice(locs, func(i, j int) bool {
		return locs[i].Less(locs[j])
	})

	for _, loc := range locs {
		record := []string{
			fmt.Sprintf("%d", loc.Segment),
			"",
			"",
			"",
			loc.Name,
			loc.Type,
		}
		if loc.Procedure != nil {
			record[1] = fmt.Sprintf("%d", *loc.Procedure)
		}
		if loc.LexLevel != nil {
			record[2] = fmt.Sprintf("%d", *loc.LexLevel)
		}
		if loc.Addr != nil {
			record[3] = fmt.Sprintf("%d", *loc.Addr)
		}
		err := w.Write(record)
		if err != nil {
			return err
		}
	}

	return nil
}

func importGlobalLabels(jsonFile string, globals map[int]types.Identifier) {
	if _, err := os.Stat(jsonFile); os.IsNotExist(err) {
		return
	}

	data, err := os.ReadFile(jsonFile)
	if err != nil {
		return
	}

	err = json.Unmarshal(data, &globals)
	if err != nil {
		return
	}
}

func importProcedures(csvFile string, procedures *[]*procedure.ProcIdentifier) {
	if _, err := os.Stat(csvFile); os.IsNotExist(err) {
		return
	}

	f, err := os.Open(csvFile)
	if err != nil {
		return
	}
	defer func(f *os.File) {
		err := f.Close()
		if err != nil {

		}
	}(f)

	r := csv.NewReader(f)
	records, err := r.ReadAll()
	if err != nil {
		return
	}

	// Skip header
	for i, record := range records {
		if i == 0 {
			continue
		}
		if len(record) < 8 {
			continue
		}

		var segNum, procNum int
		var isFunc, isAsm bool
		_, err := fmt.Sscanf(record[0], "%d", &segNum)
		if err != nil {
			return
		}
		_, err = fmt.Sscanf(record[2], "%d", &procNum)
		if err != nil {
			return
		}
		_, err = fmt.Sscanf(record[4], "%t", &isFunc)
		if err != nil {
			return
		}
		_, err = fmt.Sscanf(record[5], "%t", &isAsm)
		if err != nil {
			return
		}

		var segName, procName *string
		if record[1] != "" {
			segName = &record[1]
		}
		if record[3] != "" {
			procName = &record[3]
		}

		// Parse parameters
		var params []types.Identifier
		if record[6] != "" {
			parts := strings.Split(record[6], ";")
			for _, part := range parts {
				paramParts := strings.SplitN(part, ":", 2)
				if len(paramParts) == 2 {
					params = append(params, types.NewIdentifier(paramParts[0], paramParts[1]))
				} else {
					params = append(params, types.NewIdentifier(paramParts[0], ""))
				}
			}
		}

		var retType *string
		if record[7] != "" {
			retType = &record[7]
		}

		pi := procedure.NewProcIdentifier(isFunc, isAsm, segNum, segName, procNum, procName, params, retType)
		*procedures = append(*procedures, pi)
	}
}

func exportProcedures(csvFile string, procedures []*procedure.ProcIdentifier, sysOnly bool) error {
	// Create backup
	if _, err := os.Stat(csvFile); err == nil {
		backupFile := csvFile + ".bak"
		err := os.Remove(backupFile)
		if err != nil {
			return err
		}
		err = os.Rename(csvFile, backupFile)
		if err != nil {
			return err
		}
	}

	f, err := os.Create(csvFile)
	if err != nil {
		return err
	}
	defer func(f *os.File) {
		err := f.Close()
		if err != nil {

		}
	}(f)

	w := csv.NewWriter(f)
	defer w.Flush()

	// Write header
	err = w.Write([]string{"segmentNumber", "segmentName", "procNumber", "procName", "isFunction", "isAssembly", "parameters", "returnType"})
	if err != nil {
		return err
	}

	for _, proc := range procedures {
		if sysOnly && proc.Segment != 0 {
			continue
		}
		if !sysOnly && proc.Segment == 0 {
			continue
		}

		segName := ""
		if proc.SegmentName != nil {
			segName = *proc.SegmentName
		}
		procName := ""
		if proc.ProcName != nil {
			procName = *proc.ProcName
		}

		var paramStrs []string
		for _, p := range proc.Parameters {
			paramStrs = append(paramStrs, p.String())
		}
		params := strings.Join(paramStrs, ";")

		retType := ""
		if proc.ReturnType != nil {
			retType = *proc.ReturnType
		}

		err := w.Write([]string{
			fmt.Sprintf("%d", proc.Segment),
			segName,
			fmt.Sprintf("%d", proc.Procedure),
			procName,
			fmt.Sprintf("%t", proc.IsFunction),
			fmt.Sprintf("%t", proc.IsAssembly),
			params,
			retType,
		})
		if err != nil {
			return err
		}
	}

	return nil
}

func decodePascalProcedureEnhanced(
	currSeg *segment.Segment,
	procedureNumber int,
	proc *procedure.Procedure,
	code []byte,
	addr int,
	callers map[string]*types.Call,
	allLocations map[string]*types.Location,
	allProcedures []*procedure.ProcIdentifier,
	verbose bool,
) error {
	// Early validation
	if addr < 0 {
		return fmt.Errorf("invalid negative addr")
	}
	if addr+1 >= len(code) {
		return fmt.Errorf("addr out of bounds")
	}
	if addr-8 < 0 {
		return fmt.Errorf("insufficient header space")
	}

	cd := types.NewCodeData(code, 0, 0)

	// Read header fields with bounds-checked reads
	lexical, err := cd.ReadByteAt(addr + 1)
	if err != nil {
		return err
	}
	proc.LexicalLevel = int(lexical)
	if proc.LexicalLevel > 127 {
		proc.LexicalLevel -= 256
	}

	proc.EnterIC, err = cd.GetSelfRefPointer(addr - 2)
	if err != nil {
		return err
	}
	proc.ExitIC, err = cd.GetSelfRefPointer(addr - 4)
	if err != nil {
		return err
	}

	paramSize, err := cd.ReadWordAt(addr - 6)
	if err != nil {
		return err
	}
	proc.ParameterSize = int(paramSize) >> 1

	dataSize, err := cd.ReadWordAt(addr - 8)
	if err != nil {
		return err
	}
	proc.DataSize = int(dataSize) >> 1

	// Validate computed entry/exit ICs
	if proc.EnterIC < 0 || proc.ExitIC < 0 ||
		proc.EnterIC >= addr || proc.ExitIC >= addr ||
		proc.EnterIC >= len(code) || proc.ExitIC >= len(code) {
		return fmt.Errorf("invalid IC values")
	}

	segNum := currSeg.SegNum
	isFunction := false

	proc.EntryPoints[proc.EnterIC] = true
	proc.EntryPoints[proc.ExitIC] = true

	// Build lookup dictionaries for O(1) access
	procLookup := make(map[string]*procedure.ProcIdentifier)
	for _, p := range allProcedures {
		key := fmt.Sprintf("%d:%d", p.Segment, p.Procedure)
		procLookup[key] = p
	}

	labelLookup := make(map[string]*types.Location)
	for _, label := range allLocations {
		key := label.Key()
		//procNum := -1
		//if label.Procedure != nil {
		//	procNum = *label.Procedure
		//}
		//addrNum := -1
		//if label.Addr != nil {
		//	addrNum = *label.Addr
		//}
		//key := fmt.Sprintf("%d:%d:%d", label.Segment, procNum, addrNum)
		labelLookup[key] = label
	}

	// Initialize components
	opcodeDecoder := decoder.NewOpcodeDecoder(cd)
	stack := simulator.NewStackSimulator()
	pseudoGen := codegen.NewPseudoCodeGenerator(procLookup, labelLookup)

	// Decode loop
	ic := proc.EnterIC
	done := false

	for ic < addr && !done {
		currentIC := ic
		opcode, err := cd.ReadByteAt(ic)
		if err != nil {
			break
		}

		// Decode the instruction
		decoded, err := opcodeDecoder.Decode(opcode, ic, currSeg, segNum,
			procedureNumber, proc, addr, allLocations)
		if err != nil {
			if verbose {
				fmt.Printf("Decode error at IC 0x%04x in segment %d proc %d: %v\n",
					ic, segNum, procedureNumber, err)
			}
			return err
		}

		// Handle comparator opcodes specially
		finalMnemonic := decoded.Mnemonic
		finalComment := decoded.Comment
		bytesConsumed := decoded.BytesConsumed
		if decoded.RequiresComparator {
			cmpInfo := opcodeDecoder.DecodeComparator(decoded.ComparatorOffset)
			finalMnemonic += cmpInfo.Suffix

			opStr := "="
			switch decoded.Mnemonic {
			case "GEQ":
				opStr = ">="
			case "GRT":
				opStr = ">"
			case "LEQ":
				opStr = "<="
			case "LES":
				opStr = "<"
			case "NEQ":
				opStr = "<>"
			}
			finalComment = cmpInfo.Prefix + " TOS-1 " + opStr + " TOS"
			bytesConsumed = cmpInfo.Inc + 1
		}

		// Apply stack operations and generate pseudo-code
		var pseudoCode string

		// Use pseudocode generator for expression building
		pseudoGen.SimulateAndGenerate(opcode, decoded, stack)

		// Generate statements for store/call opcodes
		pseudoCode = pseudoGen.GenerateForInstruction(decoded, stack)

		// Handle control flow
		switch opcode {
		case decoder.UJP:
			if len(decoded.Params) > 0 {
				target := decoded.Params[0]
				proc.EntryPoints[target] = true
			}

		case decoder.FJP:
			if len(decoded.Params) > 0 {
				target := decoded.Params[0]
				proc.EntryPoints[target] = true
			}

		case decoder.RNP, decoder.RBP:
			pseudoCode = "RETURN"
			done = true

		case decoder.CXP, decoder.CIP, decoder.CBP, decoder.CLP, decoder.CGP:
			// Procedure/function calls handled by pseudoGen
			if decoded.Destination != nil {
				origin := types.NewLocation(segNum, &procedureNumber, nil, &currentIC, "", "")
				call := types.NewCall(origin, decoded.Destination)
				callers[call.String()] = call

				// Check if it's a function
				destKey := fmt.Sprintf("%d:%d", decoded.Destination.Segment, *decoded.Destination.Procedure)
				if procInfo, ok := procLookup[destKey]; ok {
					if procInfo.IsFunction {
						isFunction = true
					}
				}
			}
		}

		// Build stack state for instruction
		stackState := stack.Snapshot()

		// Create pseudocode entries if generated
		var pseudoCodes []types.PseudoCode
		if pseudoCode != "" {
			pseudoCodes = append(pseudoCodes, types.PseudoCode{
				Code:        pseudoCode,
				IndentLevel: 1,
			})
		}

		// Store instruction
		inst := types.NewInstruction([]byte{opcode},
			finalMnemonic,
			decoded.Params,
			decoded.MemLocation,
			decoded.Destination,
			&finalComment,
			true,
			stackState,
			nil,
			pseudoCodes,
		)
		proc.Instructions[currentIC] = inst

		// Advance IC
		if bytesConsumed <= 0 {
			// Safety check: prevent infinite loop
			bytesConsumed = 1
		}
		ic += bytesConsumed
	}

	// Update procedure type
	if proc.ProcType == nil {
		proc.ProcType = procedure.NewProcIdentifier(
			isFunction,
			false,
			segNum,
			&currSeg.Name,
			procedureNumber,
			nil,
			[]types.Identifier{},
			nil,
		)

		// Add parameters
		if proc.ParameterSize > 0 {
			paramCount := proc.ParameterSize
			if isFunction {
				paramCount -= 2
			}
			if paramCount > 0 {
				for parmNum := 1; parmNum <= paramCount; parmNum++ {
					param := types.NewIdentifier(fmt.Sprintf("PARAM%d", parmNum), "UNKNOWN")
					proc.ProcType.Parameters = append(proc.ProcType.Parameters, param)
				}
			}
		}
	}

	// Update return value locations for functions
	if proc.ProcType != nil && proc.ProcType.IsFunction {
		// Set location 1 to return value
		retAddr := 1
		retLoc := types.NewLocation(segNum, &procedureNumber, &retAddr, nil,
			proc.ProcType.ShortDescription(), "UNKNOWN")
		if proc.ProcType.ReturnType != nil {
			retLoc.Type = *proc.ProcType.ReturnType
		}
		key := retLoc.String()
		allLocations[key] = retLoc

		// For REAL return types, also set location 2
		if proc.ProcType.ReturnType != nil && *proc.ProcType.ReturnType == "REAL" {
			retAddr2 := 2
			retLoc2 := types.NewLocation(segNum, &procedureNumber, &retAddr2, nil,
				proc.ProcType.ShortDescription(), "REAL")
			key2 := retLoc2.String()
			allLocations[key2] = retLoc2
		}
	}

	return nil
}

func prettyStack(s []string) string {
	if len(s) == 0 {
		return "[]"
	}
	return "[" + strings.Join(s, ", ") + "]"
}

func outputResults(
	filename string,
	segDict *segment.SegDictionary,
	codeSegs map[int]*segment.CodeSegment,
	allLocations map[string]*types.Location,
	allProcedures []*procedure.ProcIdentifier,
	allCallers map[string]*types.Call,
) {
	fmt.Printf("# %s\n\n", filename)
	fmt.Println(segDict.String())

	// Print globals
	fmt.Println("\n## Globals\n")

	// Collect and sort global locations
	var globals []*types.Location
	for _, loc := range allLocations {
		if loc.LexLevel != nil && *loc.LexLevel == -1 && loc.Segment == 0 && loc.Addr != nil {
			globals = append(globals, loc)
		}
	}
	sort.Slice(globals, func(i, j int) bool {
		if globals[i].Addr == nil {
			return false
		}
		if globals[j].Addr == nil {
			return true
		}
		return *globals[i].Addr < *globals[j].Addr
	})

	for _, loc := range globals {
		if loc.Addr != nil {
			fmt.Printf("G%d=%s\n", *loc.Addr, loc.String())
		}
	}
	fmt.Println()

	// Sort segments
	segKeys := make([]int, 0, len(codeSegs))
	for k := range codeSegs {
		segKeys = append(segKeys, k)
	}
	sort.Ints(segKeys)

	// Process each segment
	for _, segKey := range segKeys {
		codeSeg := codeSegs[segKey]
		seg := segDict.SegTable[segKey]
		if seg == nil {
			continue
		}

		segName := seg.Name
		if segName == "" {
			segName = "Unknown"
		}

		fmt.Printf("## Segment %s (%d)\n\n", segName, segKey)

		if len(codeSeg.Procedures) == 0 {
			continue
		}

		// Process each procedure
		for _, proc := range codeSeg.Procedures {
			// Find procedure description
			var procDesc *procedure.ProcIdentifier
			for _, p := range allProcedures {
				if proc.ProcType != nil && p.Segment == segKey && p.Procedure == proc.ProcType.Procedure {
					procDesc = p
					break
				}
			}

			// Print procedure header
			headerDesc := ""
			if procDesc != nil {
				headerDesc = procDesc.String()
			} else if proc.ProcType != nil {
				headerDesc = proc.ProcType.String()
			}

			procNum := -99
			if proc.ProcType != nil {
				procNum = proc.ProcType.Procedure
			}

			fmt.Printf("### %s (* P=%d, LL=%d, D=%d *)\n",
				headerDesc, procNum, proc.LexicalLevel, proc.DataSize)

			// Print callers
			var callerNames []string
			for _, call := range allCallers {
				if call.Target.Procedure != nil && proc.ProcType != nil &&
					*call.Target.Procedure == proc.ProcType.Procedure &&
					call.Target.Segment == segKey {

					// Find caller name
					for _, p := range allProcedures {
						if call.Origin.Procedure != nil &&
							p.Segment == call.Origin.Segment &&
							p.Procedure == *call.Origin.Procedure {
							callerNames = append(callerNames, p.ShortDescription())
							break
						}
					}
				}
			}
			if len(callerNames) > 0 {
				fmt.Printf("Callers: %s\n", strings.Join(callerNames, ", "))
			}

			// Print local variables
			fmt.Println("```")

			var locals []*types.Location
			for _, loc := range allLocations {
				if proc.ProcType != nil && loc.Procedure != nil &&
					*loc.Procedure == proc.ProcType.Procedure &&
					loc.Segment == segKey && loc.Addr != nil {
					locals = append(locals, loc)
				}
			}
			sort.Slice(locals, func(i, j int) bool {
				if locals[i].Addr == nil {
					return false
				}
				if locals[j].Addr == nil {
					return true
				}
				return *locals[i].Addr < *locals[j].Addr
			})

			for _, loc := range locals {
				if loc.Addr != nil {
					fmt.Printf("L%d=%s\n", *loc.Addr, loc.String())
				}
			}
			fmt.Println("```")

			// Print code
			isAssembly := proc.ProcType != nil && proc.ProcType.IsAssembly
			if !isAssembly {
				fmt.Println("```pascal")
				fmt.Println("BEGIN")
			} else {
				fmt.Println("```assembly")
				fmt.Println("; ASSEMBLER PROCEDURE")
			}

			indentLevel := 1

			// Sort instructions by address
			ics := make([]int, 0, len(proc.Instructions))
			for ic := range proc.Instructions {
				ics = append(ics, ic)
			}
			sort.Ints(ics)

			// Print each instruction
			for _, address := range ics {
				inst := proc.Instructions[address]

				// Print pre-pseudo-code
				for _, pseudo := range inst.PrePseudoCode {
					if strings.HasPrefix(pseudo.Code, "END") || strings.HasPrefix(pseudo.Code, "UNTIL") {
						indentLevel--
						if indentLevel < 0 {
							indentLevel = 0
						}
					}
					if indentLevel > 20 {
						indentLevel = 20 // Safety limit
					}
					indent := strings.Repeat(" ", indentLevel*2)
					fmt.Printf("%s%s\n", indent, pseudo.Code)
					if strings.HasSuffix(pseudo.Code, "BEGIN") || strings.HasPrefix(pseudo.Code, "REPEAT") {
						indentLevel++
					}
				}

				// Print entry point marker
				if proc.EntryPoints[address] {
					fmt.Print("-> ")
				} else {
					fmt.Print("   ")
				}

				// Print address
				fmt.Printf("%04x: ", address)

				if inst.IsPascal {
					// Print mnemonic
					fmt.Printf("%-8s", inst.Mnemonic)

					// Print parameters
					ps := ""
					for _, p := range inst.Params {
						if p > 0xff {
							ps += fmt.Sprintf("%04x ", p)
						} else {
							ps += fmt.Sprintf("%02x ", p)
						}
					}
					fmt.Printf("%-15s", ps)

					// Print comment
					if inst.Comment != nil && *inst.Comment != "" {
						fmt.Printf(" ; %s", *inst.Comment)
					}

					// Print memory location
					if inst.MemLocation != nil {
						fmt.Printf(" %s", inst.MemLocation.Name)
					}

					// Print destination
					if inst.Destination != nil {
						var destName string
						for _, p := range allProcedures {
							if inst.Destination.Procedure != nil &&
								p.Segment == inst.Destination.Segment &&
								p.Procedure == *inst.Destination.Procedure {
								destName = p.ShortDescription()
								break
							}
						}
						if destName != "" {
							fmt.Printf(" %s", destName)
						} else {
							fmt.Printf(" %s", inst.Destination.String())
						}
					}

					// Print stack state
					fmt.Printf(" %s", prettyStack(inst.StackState))
				} else {
					// Assembly instruction
					fmt.Print(inst.Mnemonic)
				}

				fmt.Println()

				// Print pseudo-code
				if inst.PseudoCode != nil {
					if strings.HasPrefix(inst.PseudoCode.Code, "END") || strings.HasPrefix(inst.PseudoCode.Code, "UNTIL") {
						indentLevel--
						if indentLevel < 0 {
							indentLevel = 0
						}
					}
					fmt.Println()
					if indentLevel > 20 {
						indentLevel = 20 // Safety limit
					}
					fmt.Printf("%s%s\n", strings.Repeat(" ", indentLevel*2), inst.PseudoCode.Code)
					fmt.Println()
					if strings.HasSuffix(inst.PseudoCode.Code, "BEGIN") || strings.HasPrefix(inst.PseudoCode.Code, "REPEAT") {
						indentLevel++
					}
				}
			}

			fmt.Println("END")
			fmt.Println("```")
			fmt.Println()
		}
	}
}
