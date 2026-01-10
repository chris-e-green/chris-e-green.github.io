# TODO

- ~~Put the metadata files in a separate (configurable?) directory~~
- ~~Check whether there's a more 'swiftian' equivalent to FileManager~~
- Find out if there's a clean way to check for the existence of a directory
- Auto-map proc/func parameters to their memory locations
- Auto-detect the datatype of memory locations based on the operations called and from that info it should be possible to extrapolate it to populate the types of derived variables too (integer, real, char should be fairly simple, boolean might be a bit harder)
- make sure all opcodes are doing what they need to in terms of either pseudo-code or stack
- ~~tidy up parentheses when they end up being duplicated unneccessarily~~
- finish checking for and removing unnecessary structures that are relics of 
  earlier approaches and data structures
- memLocation etc should be checking if the location already exists in allLocations before
  creating one - and using the one it finds if it's there
- when parameters are being automapped to locations, the location is being duplicated 
  instead of replaced - sometimes actually a duplicated remapped entry too (eg L1=Sn_Pn_Ln_An, L1=PROC.FUNCn:UNKNOWN, or even L1=PROC.FUNCn:UNKNOWN,L1=PROC.FUNCn:UNKNOWN)
- function results are being mapped to memory locations but not the parameters
- stack isn't always cleared at the end of the procedure, so something's off...
- see if we can turn the XJP pseudo-code into an actual case structure
- the calculation of procedure numbers for relative locations is broken
- in UJP, try to handle while structure rather than as a goto
- move the pseudocode generation to a whole new process, rather than trying to do it in the decode pass.
- FJP where instruction just before target instruction = UJP is an IF/ELSE. The target is the start of the ELSE clause.