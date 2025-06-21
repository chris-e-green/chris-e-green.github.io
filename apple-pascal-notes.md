# Apple II Pascal notes
In an effort to fill an (apparent) gap 
in the available information on the behaviour
of the various Apple II Pascal p-machine 
implementations,
I have been progressively pulling apart and
deciphering the different flavours. 

So that the information I work out isn't lost,
I plan to document what I find here. 

Getting the developer versions is relatively 
straightforward, as they are the ones that 
shipped with Apple Pascal. The runtime versions 
are harder to find because it seems your best 
bet is to find something that was written in 
Apple Pascal and shipped using the runtime 
interpreter, and finding out what it was. 
Unfortunately for the software archaeologist, 
the version number is populated at runtime 
by the initialisation code (version number 
into $BF21, flavor into $BF22, for versions
 1.1 and above).

To date, I've been able to locate:

- version 1.0 (64k, developer)
- version 1.1 (48k, runtime)
- version 1.1 (64k, developer)
- version 1.1 (flavor A, still analysing to find out what makes it different)
- version 1.1 (flavor B, still analysing as per flavor B)
- version 1.2 (64k, developer)
- version 1.2 (128k, developer)
- version 1.2 (128k, runtime)
- version 1.3 (64k, developer)
- version 1.3 (128k, developer)
- version 1.3 (128k, runtime)

## Curiosities

- Version 1.0 (full) does not implement `CSP USTAT` all others do.
- The Apple documentation for `XJP` appears to have been consistently wrong for all versions. The documentation records the parameters as being `W1,W2,<chars>,W3`. However, the actual implementation is `W1,W2,W3,<chars>` - which matches the UCSD documentation for that call.
- Flavor was introduced at the same time as rhe version number, but in version 1.1 it was an enumeration whereas in 1.2 and 1.3 it was a bit field. As a result, there is no relationship between the values in 1.1 and 1.2/1.3. 

## Boot code

To fully understand the load behaviour of the interpreter, you have to first understand the behaviour of the boot code on an Apple Pascal disk. 

The 48k runtime version(s?) used a completely different boot loader to the development flavor. 

### Developer boot code 

It appears that versions 1.0, 1.1 and 1.2 all used the same boot loader, while 1.3 used a new loader. 

All of the boot loaders do the same thing as far as load addresses are concerned. 

The file (SYSTEM.APPLE) is always 16k long, no matter which version or flavor. 

The first $3000 bytes are loaded into the switched RAM and bank 2, from $D000-$FFFF.
The remaining $1000 bytes are loaded into bank 1 from $D000-$DFFF.

### 48k runtime boot code

To date I have only been able to find a version 1.1 48k runtime interpreter, so I am not sure what other versions (if they existed) did. 

For 1.1, the boot code loads the entire RTSTRP.APPLE directly into memory starting at $9200. The file is 12K long, so ...

