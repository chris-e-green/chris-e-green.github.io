package main

import (
	"flag"
	"fmt"
	"os"

	"pdisasm-go/pkg/pdisasm"
)

func main() {
	filename := flag.String("filename", "../code/SYSTEM.COMPILER-04-00.bin", "The file to decompile")
	verbose := flag.Bool("verbose", true, "Run with verbose output")
	rewrite := flag.Bool("rewrite", false, "Rewrite reference data")
	metadata := flag.String("metadata", "/Users/chris/Repos/chris-e-green.github.io/pdisasm/metadata", "Path to read/write metadata files")

	flag.Parse()

	fmt.Printf("pdisasm-cli: running decompiler on %s (verbose=%v)\n", *filename, *verbose)

	err := pdisasm.RunPdisasm(*filename, *verbose, *rewrite, *metadata)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error: %v\n", err)
		os.Exit(1)
	}
}
