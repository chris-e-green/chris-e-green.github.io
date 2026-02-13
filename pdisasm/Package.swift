// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "pdisasm",
    platforms: [
        .macOS(.v26)
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.0"),
    .package(url: "https://github.com/dehesa/CodableCSV.git", from: "0.6.7"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        // Expose the core code as a library target so other executables (run-sim, CLI) can import it.
        .target(
            name: "pdisasm",
            dependencies: [
                .product(name: "CodableCSV", package: "CodableCSV"),
            ],
            exclude: ["ModelTwo.swift.old"]
        ),
        .executableTarget(
            name: "pdisasm-cli",
            dependencies: [
                "pdisasm",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ],
            swiftSettings: [
                .swiftLanguageMode(.v6)
            ]
        ),
        .executableTarget(
            name: "run-sim",
            dependencies: ["pdisasm"]
        ),
        .testTarget(
            name: "pdisasmTests",
            dependencies: ["pdisasm"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
