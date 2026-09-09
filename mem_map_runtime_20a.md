| Name      | Start | End  | Length | R | W | X | Overlayed Space | Source        |
|-----------|-------|------|--------|---|---|---|-----------------|---------------|
| ZERO_PAGE | 0000  | 00ff | 0x100  | Y | Y |   |                 | uninitialised |
| STACK     | 0100  | 01ff | 0x100  | Y | Y |   |                 | unititialised |
| IN        | 0200  | 02ff | 0x100  | Y | Y |   |                 | unititialised |
| BUF       | 0300  | 03ff | 0x100  | Y | Y |   |                 | unititialised |
| TEXT1     | 0400  | 07ff | 0x400  | Y | Y |   |                 | unititialised |
| TEXT2     | 0800  | 0bff | 0x400  | Y | Y |   |                 | unititialised |
| PDATA     | bd00  | bfff | 0x300  | Y | Y |   |                 | uninitialised |
| SSW       | c000  | c0ff | 0x100  | Y | Y |   |                 | uninitialised |
| BOOT      | 0800  | 0bff | 0x400  | Y | Y | Y |                 | p11boot.bin   |
| DISKII    | c600  | c6ff | 0x100  | Y |   | Y |                 | Apple Disk II 16 Sector ROM[0x0,0x100] |
| BANK1     | d000  | dfff | 0x1000 | Y | Y | Y |                 | SYSTEM.APPLE-02-0A.bin[0x3000,0x1000] |
| BANK2a    | e000  | ffff | 0x2000 | Y | Y | Y |                 | SYSTEM.APPLE-02-0A.bin[0x1000,0x2000] |
| BANK2     | d000  | dfff | 0x1000 | Y | Y | Y | RAM             | SYSTEM.APPLE-02-0A.bin[0x0,0x1000] |
| ROM       | c000  | ffff | 0x4000 | Y |   | Y | RAM             | Apple2e.rom[0x0,0x4000] |
