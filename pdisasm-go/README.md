# pdisasm-go

A Go implementation of the Pascal P-code disassembler. This is a port of the Swift version in `../pdisasm`.

## Status

🚧 **Work in Progress** - Initial port from Swift to Go.

## Structure

```
cmd/
  pdisasm/          - Main CLI executable
  run-sim/          - Simulator executable
internal/
  decoder/          - P-code opcodes and decoder
  segment/          - Segment and code segment types
  procedure/        - Procedure types and dictionaries
  simulator/        - P-code simulator
  codegen/          - Pseudo-code generator
  types/            - Core types (Location, Instruction, etc.)
  arch/             - Architecture-specific code (WDC 6502)
pkg/pdisasm/        - Public API
```

## Building

```bash
go build -o pdisasm ./cmd/pdisasm
go build -o run-sim ./cmd/run-sim
```

## Testing

```bash
go test ./...
```

## Usage

```bash
./pdisasm -filename path/to/file.bin -verbose
```

## Dependencies

- Standard library only (flag, encoding/csv, encoding/json, os, fmt, etc.)
