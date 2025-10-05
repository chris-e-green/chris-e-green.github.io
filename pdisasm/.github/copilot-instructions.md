# AI Agent Instructions for pdisasm

This repository contains a Swift-based disassembler for Apple Pascal P-code binaries, implemented as a command-line tool using Swift Package Manager.

## Project Architecture

### Core Components

- `pdisasm.swift`: Main entry point and command-line interface using ArgumentParser
- `Output.swift`: Handles formatting and output of disassembled code
- `CodeSegment.swift`: Manages code segment parsing and representation
- `Procedure.swift`: Represents individual procedures and their instructions
- `CodeData.swift`: Manages raw binary data and provides utilities for reading
- `Segment.swift`: Defines segment types and data structures for Pascal segments
- `PascalProcedure.swift`: Core disassembly logic for Pascal procedures
- `WDC6502.swift`: Support for WDC 6502 assembly code segments
- Data structures in `CodeSegment.swift`, `Procedure.swift`, `CodeData.swift`

### Key Workflows

1. File Processing:
   - Binary data is read from `.bin` file
   - Segments are parsed from header (first 512 bytes)
   - Code blocks are extracted and disassembled 

2. P-code Disassembly:
   - Segments are processed based on their type (Pascal/Assembly)
   - Procedures within segments are identified and decoded
   - Instructions are translated to human-readable format
### Project-Specific Patterns

1. Memory Addressing:
   - Global variables use `G{n}` notation
   - Local variables use `MP{n}` for Mark Pointer relative addressing
   - Base variables use `BASE{n}` for base-relative addressing

2. Code Structure:
   - Uses Swift enums for instruction set definitions
   - Extensive use of Swift Data extensions for binary parsing
   - Procedure calling patterns captured in caller/callee relationships

## Development Workflow

### Building and Testing

```bash
# Build the project
swift build

# Run with default input file
swift run pdisasm

# Run with custom input file
swift run pdisasm --filename path/to/file.bin

# Run with verbose output
swift run pdisasm --verbose
```

### Debug Support

- VS Code launch configurations are provided for debugging
- Use breakpoint instruction (BPT) locations for debugging P-code

## Integration Points

1. Binary Format:
   - Expects Apple Pascal P-code binary format
   - First 512 bytes contain segment directory
   - Code blocks are 512-byte aligned

2. Output Format:
   - Markdown-formatted disassembly output
   - Segment and procedure hierarchy preserved
   - Cross-references for procedure calls maintained

## Common Tasks

1. Adding New Instructions:
   - Update instruction parsing in `decodePascalProcedure`

2. Extending Output:
   - Modify `outputResults()` in `Output.swift`
   - Follow existing markdown formatting patterns