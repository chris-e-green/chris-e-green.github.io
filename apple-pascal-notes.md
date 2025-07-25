# Apple II Pascal notes

In an effort to fill an (apparent) gap in the available information on the
behaviour of the various Apple II Pascal p-machine implementations, I have been
progressively pulling apart and deciphering the different flavours.

So that the information I work out isn't lost, I plan to document what I find
here.

## Acknowledgements and References 

I have read a wide collection of documentation to get to where I am so far in this exercise. 
These include:

- Apple Pascal Operating System Reference Manual
- Apple Pascal Language Reference Manual
- Apple Pascal Update 1.1
- Apple II Pascal 1.2 Device and Interrupt Support Tools Manual
- Apple IIe Reference Manual
- Apple Pascal 1.2 Update Manual
- Apple IIe Technical Reference Manual
- Apple II Pascal 1.3 (Workbench)
- Addendum to the Apple Pascal Language Reference Manual
- Apple IIe Reference Manual Addendum Monitor ROM Listings
- Addendum to the Apple II Pascal 1.2 Update
- Apple II Pascal ATTACH
- Apple IIc Delta Guide
- Apple II Pascal 1.1 P-Code Interpreter 6502 Disassembly (Willi Kusche)
- Beneath Apple DOS ProDOS
- Hyde's P-Source A guide to the Apple Pascal System 1983
- Software Control of IWM
- Apple II Technical Notes

I have also used various websites that cover different related Apple II components.
Some of those websites include:
- [Apple II ROM Disassembly](https://6502disassembly.com/a2-rom/) is useful when making sense of the boot process. It also documents the Disk II ROM (some of which is effectively replicated in the Pascal boot code *and* in the runtime)
- [Undocumented Secrets of Apple Pascal](https://llx.com/Neil/a2/passec.html) has some useful information.
- [ProDOS 8 Technical Reference Manual](https://prodos8.com/docs/techref/) has useful information for the later runtimes that were able to use ProDOS block devices 

I have also of course used various programs (and web apps) along the way to help with disassembly and annotation.
Some of those programs and web apps are:

- [White Flame interactive 6502 disassembler (WFDis)](https://www.white-flame.com/wfdis/) I used this disassembler for quite a while as it's great for quickly getting an idea what the code does
- [DiskBrowser](https://github.com/dmolony/DiskBrowser) is very useful for browsing Apple II disk images and extracting files
- [Ghidra](https://github.com/NationalSecurityAgency/ghidra) This is like using a sledgehammer to crack a walnut but it is very powerful
- [Ivan Izaguirre's izApple2 emulator](https://github.com/ivanizag/izapple2) is the emulator that I started playing around with, which led me down a lonnng rabbit hole leading to wanting to know how the P-machine on the Apple II worked.... 
- [Peter Miller's UCSD P-System tools - Operating System](https://github.com/jdykstra/ucsd-psystem-os) A fork of the original which seems harder to locate. Handy for getting an idea what was intended to be stored in the SYSCOM memory area (the Apple II versions are at least similar where they're not the same)

I'm bound to have missed some but these have all been very useful. Even when they were not 100% correct, they were close enough to make it easier to work out what was actually happening. 

## Sources

Getting the developer versions is relatively straightforward, as they are the
ones that shipped with Apple Pascal. The runtime versions are harder to find
because it seems your best bet is to find something that was written in Apple
Pascal and shipped using the runtime interpreter, and finding out what it was.
Unfortunately for the software archaeologist, the version number is populated
at runtime by the initialisation code (version number into \$BF21, flavor into
\$BF22, for versions 1.1 and above).

To date, I've been able to locate:

| User-facing version | Internal version | Flavor | RAM    | Type      | Notes                                                                                             |
| ------------------- | ---------------- | ------ | ------ | --------- | ------------------------------------------------------------------------------------------------- |
| 1.0                 | 1                | 0      | 64K    | developer |                                                                                                   |
| 1.1                 | 2                | 5      | 48K    | runtime   |                                                                                                   |
| 1.1                 | 2                | 1      | 64K    | developer |                                                                                                   |
| 1.1                 | 2                | A      | 64K(?) | runtime   | flavor not documented. The Pascal OS is identical with flavor B but the interpreter is different. |
| 1.1                 | 2                | B      | 64K(?) | runtime   | flavor not documented. The Pascal OS is identical with flavor A but the interpreter is different. |
| 1.2                 | 3                | 0      | 64K    | developer |                                                                                                   |
| 1.2                 | 3                | 40     | 128K   | developer |                                                                                                   |
| 1.2                 | 3                | 41     | 128K   | runtime   |                                                                                                   |
| 1.3                 | 4                | 0      | 64K    | developer |                                                                                                   |
| 1.3                 | 4                | 40     | 128K   | developer |                                                                                                   |
| 1.3                 | 4                | 41     | 128K   | developer |                                                                                                   |

## Methodology

I've used a few different tools along the way, but what I've finally settled on is Ghidra, plus DiskBrowser. 

My current workflow looks like this:
1. Extract the boot code from a Pascal disk. I use a script 
```bash
#!/bin/bash
dd if=$1 of=/tmp/boot0.bin bs=256 count=1
dd if=$1 of=/tmp/boot1.bin bs=256 count=1 skip=14
dd if=$1 of=/tmp/boot2.bin bs=256 count=1 skip=13
dd if=$1 of=/tmp/boot3.bin bs=256 count=1 skip=12
cat /tmp/boot0.bin /tmp/boot1.bin /tmp/boot2.bin /tmp/boot3.bin > /tmp/boot.bin
```
`/tmp/boot.bin` will be the boot code. The ordering above deals with the sector skewing.
2. Use DiskBrowser to extract the P-Code interpreter (`RTSTRP.APPLE` or `SYSTEM.APPLE`).
3. Get an Apple II+/IIe ROM file and a 16-sector Disk II controller card ROM (the P5).
4. Create a new project in Ghidra, using the boot code as the initial file. Load it using 6502 language, as block name `BOOT` at \$0800.
5. Add the Apple ROM as an overlay, block name `ROM`. If it's a 16K ROM image (Apple IIe), load it at base address \$C000, if it's Apple II+, load it at base address \$D000. Loading the ROM as an overlay makes life easier later, because *most* calls from the runtime into higher addresses are not into the ROM.
6. Add the Disk II ROM, __*not*__ as an overlay, block name `DISKII`, base address \$C600.
7. The following applies to the 16K runtime.
8. There is code that starts in bank1 and continues in the LC RAM, so to make it easier to follow, we will load the interpreter in parts. 
9. Add it to the project, __*not*__ as an overlay, block name BANK1, at 0xD000, file offset 0x3000, length 0x1000
10. Add it to the project again, as an overlay, block name BANK2, at base address 0xD000, file offset 0x0, length 0x1000
11. Add it to the project once more, __*not*__ as an overlay, block name BANK2a, at base address 0xE000, file offset 0x1000, length 0x2000.
12. At this point we have more or less replicated the memory layout at the conclusion of the boot load process.
13. There are also some RAM regions that we can add at this point to the project. Ghidra should have already created `ZERO_PAGE` at 0x0000 length 0x100 and `STACK` at 0x0100 length 0x100. We can add to that: `IN` at 0x0200 length 0x100, `BUF` from 0x0300 length 0x100, `TEXT1` at 0x0400 length 0x400, `PDATA` at 0xBD00 length 0x300 and `SSW` at 0xC000 length 0x100. These can all be created in the Memory Map window in Ghidra. While there we can turn on the Write and Execute flags for BANK2 and turn on the Execute flag for ROM. 
14. We can now start disassembly.

## Disassembly

I often start by running an automatic disassembly at \$C600. The last bit of that code is a jump to \$0801, which we can follow into the boot code we loaded earlier. You'll find that Ghidra has already disassembled a chunk of the boot code. 

At this point it's quite useful to associate names with the various soft-switches in the \$C0 page (and also some names associated with fixed locations in the zero page).

This file contains the soft switch names below in a format that can be imported directly into ghidra using the ImportSymbolsScript.py:
![[soft_switches.txt]]

This file contains key zero-page named locations that can be imported in the same fashion:
![[zero_page.txt]]

First, the ones that are absolute/fixed locations (there are other soft switches, but these are the ones referenced in the Pascal runtimes):

| Address | Label          | Address | Label     | Address | Label        |
| ------- | -------------- | ------- | --------- | ------- | ------------ |
| C000    | CLR80STORE (W) | C016    | RDALTZP   | C060    | IIC40COL     |
| C000    | KBD (R)        | C018    | RD80STORE | C061    | SW0OPAPPL    |
| C001    | SET80STORE     | C01A    | RDTEXT    | C062    | SW1CLAPPL    |
| C002    | RDMAINRAM      | C01C    | RDPAGE2   | C063    | SW2          |
| C003    | RDAUXRAM       | C01E    | RDALTCHAR | C064    | PADDL0       |
| C004    | WRMAINRAM      | C01F    | RD80COL   | C070    | PTRIG        |
| C005    | WRAUXRAM       | C020    | TAPEOUT   | C080    | RDRAMWRNONB2 |
| C006    | SETSLOTCXROM   | C030    | SPKR      | C081    | RDROMWRRAMB2 |
| C007    | SETINTCXROM    | C050    | TXTCLR    | C083    | RDRAMWRRAMB2 |
| C008    | CLRALTZP       | C051    | TXTSET    | C088    | RDRAMWRNONB1 |
| C009    | SETALTZP       | C052    | MIXCLR    | C089    | RDROMWRRAMB1 |
| C00C    | CLR80COL       | C053    | MIXSET    | C08B    | RDRAMWRRAMB1 |
| C00D    | SET80COL       | C054    | TXTPAGE1  | C08C    | RDRAMWRNONB1 |
| C00E    | CLRALTCHAR     | C055    | TXTPAGE2  | C08D    | RDROMWRRAMB1 |
| C00F    | SETALTCHAR     | C056    | LORES     | C08F    | RDRAMWRRAMB1 |
| C010    | KBDSTRB        | C057    | HIRES     | C0AE    | S2COM_STATUS |
| C011    | RDLCBNK2       | C058    | SETAN0    | C0AF    | S2COM_DATA   |
| C012    | RDLCRAM        | C05A    | SETAN1    | C0BE    | S3COM_STATUS |
| C013    | RDRAMRD        | C05D    | CLRAN2    | C0BF    | S3COM_DATA   |
| C014    | RDRAMWRT       | C05F    | CLRAN3    | C0EC    | S6L6OFF      |
| C015    | RDCXROM        | C060    | TAPEIN    |         |              |

These ones are indexed by slot number x 0x10, so typically referenced as `LDA addr,X`. 

(Note that the last five in the table above are technically slot-indexed, but are used in the code as pre-indexed/fixed locations.)

| Address | Label       |
| ------- | ----------- |
| C080    | IWMPH0OFF   |
| C081    | IWMPH0ON    |
| C082    | IWMPH1OFF   |
| C084    | IWMPH2OFF   |
| C086    | IWMPH3OFF   |
| C088    | IWMMOTOROFF |
| C089    | IWMMOTORON  |
| C08A    | IWMSELDRV1  |
| C08C    | IWMQ6OFF    |
| C08D    | IWMQ6ON     |
| C08E    | IWMQ7OFF    |
| C08E    | COM_STATUS  |
| C08F    | COM_DATA    |
| C08F    | IWMQ7ON     |

Distinguishing the indexed soft switches from the absolute ones is essential when making sense of the code, but fortunately (1) they are all in the 0xc08n range, and (2) you can search memory in Ghidra and look for byte sequences - so for example searching for bytes `bd 8. c0` will find all `LDA C08x,X` (indexed) references, as opposed to `ad 8. c0` which are absolute `LDA C08x` references.

Indexed, absolute address instructions are `.9`, `bc`, `.d` and `.e` on a 6502, with `3c` added on a 65C02, but the p-code runtime is designed to run on any 6502. So far I have only found the following instructions referencing these particular soft-switches:

| Opcode | Mnemonic         |
| ------ | ---------------- |
| `AD`   | `LDA `*abs*      |
| `8D`   | `STA `*abs*      |
| `1D`   | `ORA ` *abs*`,X` |
| `99`   | `STA `*abs*`,Y`  |
| `9D`   | `STA ` *abs*`,X` |
| `B9`   | `LDA `*abs*`,Y`  |
| `BC`   | `LDY `*abs*`,X`  |
| `BD`   | `LDA `*abs*`,X`  |
| `D9`   | `CMP `*abs*`,Y`  |
| `DD`   | `CMP `*abs*`,X`  |
So, the `ad 8? c0` and `bd 8? c0` sequences will always be absolute (typically memory bank switches) while all of the others are indexed, and they'll be almost always disk accesses. 

The switches that change between RAM, ROM, and \$D000-\$DFFF memory banks are quite important to note, because without them your memory references are going to be completely wrong...

The chunk that we loaded into `BANK1` starts with a table (well, technically two tables) of pointers The first table runs from \$D000-\$D0FF and contains the addresses of P-Code primary op-code handlers, while the second from \$D100-\$D151 contains the addresses of the CSP sub-opcode handlers. Each pointer is to a Pascal P-Code routine, so it is useful to tell Ghidra that these are actually pointers. Ghidra will sometimes correctly disassemble the corresponding code without any further effort on your part. 

Our efforts earlier when we loaded the runtime in three parts, and loaded the Apple ROM into an overlay, now pays off - the tables are all pointing at the correct bank by default. (If we had loaded them exactly as contained in the file, we would have had to manually adjust all of the references to addresses above \$E000 to point to the correct page.)

Immediately following the tables (at \$D152) is the start of some code, so disassemble that. You'll find that it is a jump to an address fairly high in RAM that contains a routine to copy the runtime's initialisation code to \$6800.

## Curiosities

- SYSTEM.PASCAL is in two parts... the first part shows up in the directory listing but only contains the first half of the operating system core. The balance is stored in a separate unnamed file in slot 15 of
the segment directory, and is loaded by the interpreter at a fixed memory location during initialisation.
I'm still working out how the procedure table points to these procedures!

- I have not found any mention of this in the Apple Pascal documentation but I 
  have found that some buffers (specifically, those used in `UNITREAD` and 
  `UNITWRITE`, but there are others) are not actually passed as single `WORD`
  pointers. The code in the interpreter pops *two* `WORD` values for the buffer
  address. I had seen that the two values were added together to create the 
  actual buffer address, and concluded that they must have represented the 
  base buffer address and an offset into that buffer. I have now discovered 
  that the Softech manuals refer to passing this sort of buffer using two
  words, one being the word base and the other being a byte offset. Apparently,
  the purpose is to accommodate word-addressable machines. As the 6502 is byte
  addressable, the two words are simply added together in the interpreter.

- Version 1.0 (full) does not implement `CSP USTAT`, all others do.

- The Apple documentation for `XJP` appears to have been consistently wrong for
  all versions. The documentation records the parameters as being
`W1,W2,<chars>,W3`. However, the actual implementation is `W1,W2,W3,<chars>`. This matches the UCSD documentation for that call.  

- Flavor was introduced at the same time as the version number, but in version
  1.1 it was an enumeration (documented as 1-9) whereas in versions 1.2 and 1.3
it was a bit field. As a result, there is no relationship between the values in
1.1 and 1.2/1.3.

- Pascal 1.0 SYSTEM.PASCAL doesn't have the SEGINFO field in the segment dictionary. In Pascal 1.1, the segment version number is 2, but in 1.2, it is 5, and in 1.3 it's 6. 

- There are more than a few instances of clever coding in the interpreter (where *clever* has all the pros and cons often associated with the word). Examples are using `BEQ` and `BNE` on consecutive lines, so that the second instruction is effectively a `JMP` without the extra overhead. Another pattern (particularly in later interpreters) is avoiding relatively costly `PHA` and `PLA` instructions by copying the stack pointer across to the `X` register and then using indexed memory access to retrieve values directly out of the stack, doing whatever needs to be done with the values, and putting them back into the stack, and adjusting the stack pointer accordingly. In a stack-based 16-bit pseudo-machine like the UCSD one, this can avoid a dozen 8-bit `PLA` instructions to manipulate six word-length parameters...


## Boot code

To fully understand the load behaviour of the interpreter, you have to first
understand the behaviour of the boot code on an Apple Pascal disk.

First point: as the boot code is loaded from the disk controller firmware, it treats the disk as a DOS-formatted (256-byte sectors rather than Pascal 512-byte blocks) volume. When extracting the boot sectors, don't forget the DOS sector interleave... 

So, on a 16-sector track, the boot code will load logical DOS sectors 0, 2, 4 and 6 (physical sectors \$0, \$E, \$D and \$C) into \$0800-\$0BFF.

The boot code contains a subset of the Pascal code to read blocks and also simplified code to scan a Pascal directory so that it can find the interpreter file. 
### Developer boot code

It appears that versions 1.0, 1.1 and 1.2 all used the same boot loader, while
1.3 used a new loader.

The main functional difference between the 1.3 boot loader and the previous ones is that the newer one supported booting from slots 4, 5 or 6, rather than only slot 6 as had been the case previously. Once the 1.3 boot code has loaded the interpreter, it adjusts the internal `DISKNUM` table in memory to match the drive sequence:

| Pascal Unit# | Slot 4 boot | Slot 5 boot | Slot 6 boot |
| ------------ | ----------- | ----------- | ----------- |
| 4            | 4 (S4, D1)  | 2 (S5, D1)  | 0 (S6, D1)  |
| 5            | 5 (S4, D2)  | 3 (S5, D2)  | 1 (S6, D2)  |
| 9            | 0 (S6, D1)  | 4 (S4, D1)  | 4 (S4, D1)  |
| 10           | 1 (S6, D2)  | 5 (S4, D2)  | 5 (S4, D2)  |
| 11           | 2 (S5, D1)  | 0 (S6, D1)  | 2 (S5, D1)  |
| 12           | 3 (S5, D2)  | 1 (S6, D2)  | 3 (S5, D2)  |

All of the boot loaders do the same thing as far as load addresses are
concerned.

The file (SYSTEM.APPLE) is always 16k long, no matter which version or flavor.

The first $3000 bytes are loaded into the LC RAM and bank 2, from
\$D000-\$FFFF.  The remaining \$1000 bytes are loaded into bank 1 from
\$D000-\$DFFF.

### 48k runtime boot code

The 48k runtime version(s?) used a completely different boot loader to the
development flavor.

To date I have only been able to find a version 1.1 48k runtime interpreter, so
I am not sure what other versions (if they existed) did.

For 1.1, the boot code loads the entire RTSTRP.APPLE directly into memory
starting at \$9200. While the file is 12k long, it only loads \$2d sectors, so 
it occupies \$9200-\$BFFF.

