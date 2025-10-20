# pdisasm

![CI](https://github.com/chris-e-green/chris-e-green.github.io/actions/workflows/ci.yml/badge.svg?branch=master)

pdisasm is a Swift command-line Pascal P-code disassembler. It parses Apple Pascal P-code binaries and emits a human-readable disassembly. The project includes a small test suite and a GitHub Actions workflow that runs `swift build` and `swift test` on macOS-latest.

Quick start

```bash
swift build
swift test
swift run pdisasm --filename path/to/file.bin --verbose
```

See `Sources/pdisasm` for implementation details.
