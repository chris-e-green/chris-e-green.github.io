# Apple II Pascal notes

In an effort to fill an (apparent) gap in the available information on the
behaviour of the various Apple II Pascal p-machine implementations, I have been
progressively pulling apart and deciphering the different flavours.

So that the information I work out isn't lost, I plan to document what I find
here.

Getting the developer versions is relatively straightforward, as they are the
ones that shipped with Apple Pascal. The runtime versions are harder to find
because it seems your best bet is to find something that was written in Apple
Pascal and shipped using the runtime interpreter, and finding out what it was.
Unfortunately for the software archaeologist, the version number is populated
at runtime by the initialisation code (version number into $BF21, flavor into
$BF22, for versions 1.1 and above).

To date, I've been able to locate:

| User-facing version | Internal version | Flavor | RAM | Type | Notes |
|---------------------|------------------|--------|-----|------|-------|
| 1.0 | 1 | 0 | 64K | developer | |
| 1.1 | 2 | 5 | 48K | runtime | |
| 1.1 | 2 | 1 | 64K | developer | |
| 1.1 | 2 | A | 64K(?) | runtime(?) | flavor not documented! |
| 1.1 | 2 | B | 64K(?) | runtime(?) | flavor not documented! |
| 1.2 | 3 | 0 | 64K | developer | |
| 1.2 | 3 | 40 | 128K | developer | |
| 1.2 | 3 | 41 | 128K | runtime | |
| 1.3 | 4 | 0 | 64K | developer | |
| 1.3 | 4 | 40 | 128K | developer | |
| 1.3 | 4 | 41 | 128K | developer | |

## Curiosities

- Version 1.0 (full) does not implement `CSP USTAT`, all others do.

- The Apple documentation for `XJP` appears to have been consistently wrong for
  all versions. The documentation records the parameters as being
`W1,W2,<chars>,W3`. However, the actual implementation is `W1,W2,W3,<chars>`. This matches the UCSD documentation for that call.  

- Flavor was introduced at the same time as the version number, but in version
  1.1 it was an enumeration (documented as 1-9) whereas in versions 1.2 and 1.3
it was a bit field. As a result, there is no relationship between the values in
1.1 and 1.2/1.3.

## Boot code

To fully understand the load behaviour of the interpreter, you have to first
understand the behaviour of the boot code on an Apple Pascal disk.

One aspect to remember: as the boot code is loaded from the disk controller firmware, it treats the disk as a DOS-formatted (256-byte sectors rather than Pascal 512-byte blocks) volume. When extracting the boot sectors, don't forget the DOS sector interleave... 

So, on a 16-sector track, the boot code will load logical DOS sectors 0, 2, 4 and 6 (physical sectors $0, $E, $D and $C) into $0800-$0BFF.

### Developer boot code

It appears that versions 1.0, 1.1 and 1.2 all used the same boot loader, while
1.3 used a new loader.

The main functional difference between the 1.3 boot loader and the previous ones is that the newer one supported booting from slots 4, 5 or 6, rather than only slot 6 as had been the case previously.

All of the boot loaders do the same thing as far as load addresses are
concerned.

The file (SYSTEM.APPLE) is always 16k long, no matter which version or flavor.

The first $3000 bytes are loaded into the LC RAM and bank 2, from
$D000-$FFFF.  The remaining $1000 bytes are loaded into bank 1 from
$D000-$DFFF.

### 48k runtime boot code

The 48k runtime version(s?) used a completely different boot loader to the
development flavor.

To date I have only been able to find a version 1.1 48k runtime interpreter, so
I am not sure what other versions (if they existed) did.

For 1.1, the boot code loads the entire RTSTRP.APPLE directly into memory
starting at $9200. While the file is 12k long, it only loads $2d sectors, so 
it occupies $9200-$BFFF.

