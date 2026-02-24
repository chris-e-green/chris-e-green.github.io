import ArgumentParser
import Foundation
import pdisasm

struct PdisasmCLI: @preconcurrency ParsableCommand {
    @Argument(help: "The file to decompile.")
    var filename: String = "../code/SYSTEM.PASCAL-04-00.bin"
    // var filename: String = "../code/SET40COLS.CODE-04-00.bin"
    @Option(help: "Run with verbose output.")
    var verbose: Bool = true
    @Option(help: "Rewrite reference data.")
    var rewrite: Bool = false
    @Option(help: "Show markup in output.")
    var showMarkup: Bool = false
    @Option(help: "Show pcode in output.")
    var showPcode: Bool = false
    @Option(help: "Show pseudocode in output.")
    var showPseudocode: Bool = false
    @MainActor mutating func run() throws {
        print(
            "pdisasm-cli: running decompiler on \(filename) (verbose=\(verbose))"
        )
        do {
            try runPdisasm(
                filename: filename,
                verbose: verbose,
                rewrite: rewrite,
                showMarkup: showMarkup,
                showPCode: showPcode,
                showPseudoCode: showPseudocode
            )
        } catch {
            print("Error running pdisasm: \(error)")
            throw error
        }
    }
}

struct Main {
    static func main() throws {
        PdisasmCLI.main()
    }
}
try Main.main()
