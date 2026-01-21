# TODO

## Rethinking the processing

- The current processing is trying to do almost everything in one pass.
- Some things just aren't easily (or evan, at all) able to be done that way, which has resulted in lots of complications in the way the code is handled.
- There really needs to be a re-design of how the disassembly and decompilation is handled as a result.

### Proposed phases of decompilation

- read metadata of the file
- first pass to parse/tokenize the p-code and/or 6502 code
  - this phase should be able to identify procedures and functions and to determine lex levels and calling relationships.
- second pass to normalise relative markstack references to the correct calling procedure/function
- third pass to determine the pseudocode.
  - working out control flow first,
  - then stack simulation,
  - then pseudocode generation.
- final pass to display the disassembly and/or pseudocode.
