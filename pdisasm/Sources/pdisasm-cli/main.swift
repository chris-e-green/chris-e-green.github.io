import ArgumentParser
import Foundation
import pdisasm

struct PdisasmCLI: @preconcurrency ParsableCommand {
    @Argument(help: "The file to decompile.")
    var filename: String = "/Users/chris/Documents/Legacy OS and Programming Languages/Apple/Pascal_PCode_Interpreters/SYSTEM.COMPILER-04-00.bin"
    @Option(help: "Run with verbose output.")
    var verbose: Bool = true
    @Option(help: "Rewrite reference data.")
    var rewrite: Bool = false
    @Option(help: "Path to read/write metadata files.")
    var metadata: String = "metadata"
    @MainActor mutating func run() throws {
        print("pdisasm-cli: running decompiler on \(filename) (verbose=\(verbose))")
        do {
            try runPdisasm(filename: filename, verbose: verbose, rewrite: rewrite, metadataPrefix: metadata)
        } catch {
            print("Error running pdisasm: \(error)")
            throw error
        }
    }
}

@main
struct Main {
    static func main() throws {
        PdisasmCLI.main()
    }
}
