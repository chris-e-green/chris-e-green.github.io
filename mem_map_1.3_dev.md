| Name      | Start | End  | Length | R | W | X | Overlayed Space | Source        |
|-----------|-------|------|--------|---|---|---|-----------------|---------------|
| ZERO_PAGE | 0000  | 00ff | 0x100  | Y | Y |   |                 | uninitialised |
| STACK     | 0100  | 01ff | 0x100  | Y | Y |   |                 | unititialised |
| Page2     | 0200  | 02ff | 0x100  | Y | Y |   |                 | unititialised |
| Page3     | 0300  | 03ff | 0x100  | Y | Y |   |                 | unititialised |
| TextPage1 | 0400  | 07ff | 0x400  | Y | Y |   |                 | unititialised |
| TextPage2 | 0800  | 0bff | 0x400  | Y | Y |   |                 | unititialised |
| ROM       | c000  | ffff | 0x100  | Y |   | Y |                 | Apple2e_Enhanced.rom |
| BOOT1     | 0800  | 0bff | 0x400  | Y | Y | Y | RAM             | pascal13boot.bin     |
| Bank1     | d000  | 01ff | 0x100  | Y | Y | Y | RAM             | SYSTEM.APPLE[0x3000,0x1000] |
| Bank2     | d000  | 01ff | 0x100  | Y | Y | Y | RAM             | SYSTEM.APPLE[0x0,0x3000] |
| DiskIIRom | c600  | c6ff | 0x100  | Y |   | Y | RAM             | Apple Disk II 16 Sector ROM[0x0,0x100] |
| INIT      | 6800  | 6cff | 0x500  | Y | Y | Y | RAM             | SYSTEM.APPLE[0x229b,0x500] |
