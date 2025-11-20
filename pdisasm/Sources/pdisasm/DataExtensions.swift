//
//  DataExtensions.swift
//  PascalDisassembler
//
//  Created by Christopher Green on 24/9/2025.
//
import Foundation

/// Legacy convenience helpers on `Data` kept for backward compatibility.
/// These APIs are deprecated. Prefer `CodeData` throwing read helpers
/// such as `CodeData.readByte(at:)`, `CodeData.readWord(at:)`,
/// `CodeData.readBig(at:)`, and `CodeData.getSelfRefPointer(at:)` which
/// perform bounds-checked reads and return errors on malformed input.
@available(*, deprecated, message: "Use CodeData.readXXX(...) throwing helpers instead for safe, bounds-checked reads")
extension Data {
    
    /// Returns 512-byte blocks from `Data`.
    /// - Parameters:
    ///   - blockNum: the starting block number.
    ///   - length: the number of bytes to return.
    /// - Returns: A `Data` object of `length` bytes, starting at block `blockNum`.
    /// Safe variant of extracting a 512-byte aligned code block.
    /// If the requested range is out of bounds, this returns an empty `Data`.
    /// Deprecated: prefer using `CodeData` for robust parsing of binary blocks.
    @available(*, deprecated, message: "Use CodeData to read code blocks and bytes safely")
    func getCodeBlock(at blockNum:Int, length:Int) -> Data {
        let start = Int(blockNum) * 512
        let end = start + Int(length)
        guard start >= 0, end <= self.count else { return Data() }
        return self.subdata(in: start..<end)
    }
    
    /// Read and decode a 'BIG' value from `Data`. Also returns the number of bytes used to store the value.
    /// - Parameters:
    ///   - index: the offset where the BIG value starts.
    /// - Returns: a tuple containing the decoded value and byte length.
    /// Safe non-throwing read of a 'BIG' value. If out-of-bounds, returns (0, 0).
    /// Deprecated: use `CodeData.readBig(at:)` for strict throwing behavior.
    @available(*, deprecated, message: "Use CodeData.readBig(at:) for bounds-checked, throwing reads")
    func readBig(at index: Int) -> (Int, Int) {
        guard index >= 0 && index < self.count else { return (0, 0) }
        let first = self[index]
        if first <= 127 {
            return (Int(first), 1)
        } else {
            guard index + 1 < self.count else { return (0, 0) }
            return (Int(first & 0x7F) << 8 | Int(self[index + 1]), 2)
        }
    }
    
    /// Get a word from `Data`.
    ///  - Parameters:
    ///    - index: the offset where the word value starts.
    ///  - Returns: the word stored at index.
    /// Safe non-throwing read of a little-endian word. Returns 0 on out-of-bounds.
    /// Deprecated: use `CodeData.readWord(at:)` for strict bounds checking.
    @available(*, deprecated, message: "Use CodeData.readWord(at:) for bounds-checked, throwing reads")
    func readWord(at index: Int) -> Int {
        guard index >= 0 && index + 1 < self.count else { return 0 }
        return Int(self[index]) | (Int(self[index + 1]) << 8)
    }
    
    /// Get the absolute location referenced in a self-referenced pointer in `Data`.
    ///   - Parameters:
    ///     - at: the offset of the self-referenced pointer
    ///   - Returns: the absolute pointer corresponding to the self-referenced pointer.
    /// Safe calculation of a self-referenced pointer. If the word read would be
    /// out-of-bounds, returns 0.
    /// Deprecated: use `CodeData.getSelfRefPointer(at:)` for a throwing, bounds-checked API.
    @available(*, deprecated, message: "Use CodeData.getSelfRefPointer(at:) for bounds-checked pointer resolution")
    func getSelfRefPointer(at index: Int) -> Int {
        guard index >= 0 && index + 1 < self.count else { return 0 }
        let w = readWord(at: index)
        return index - w
    }
}

