//
//  CodeData.swift
//  PascalDisassembler
//
//  Created by Christopher Green on 24/9/2025.
//

import Foundation

struct CodeData {
    var data: Data
    var ipc: Int
    var header: Int
    
    init(data: Data) {
        self.data = data
        self.ipc = 0
        self.header = 0
    }
    
    init(data: Data, ipc: Int, header: Int) {
        self.data = data
        self.ipc = ipc
        self.header = header
    }
    
    /// Read a byte from `CodeData` at `ipc`, updating `ipc`.
    /// - Returns: The byte value.
    mutating func readByte() -> Int {
        guard ipc < data.count else { fatalError("Data access out of bounds")}
        let retval = Int(data[self.ipc])
        self.ipc += 1
        return retval
    }
    
    /// Read and decode a 'BIG' value from `CodeData`, at `ipc`, `updating `ipc`.
    /// - Returns: The decoded value.
    mutating func readBig() -> Int {
        guard ipc < data.count else { fatalError("Data access out of bounds")}
        let firstByte = data[ipc]
        ipc += 1
        if firstByte <= 127 {
            return Int(firstByte)
        } else {
            guard ipc < data.count - 1 else { fatalError("Data access out of bounds")}
            let high = Int(firstByte - 0x80)
            let low = data[ipc]
            ipc += 1
            return (high << 8) | Int(low)
        }
    }
 
    /// Get a word from  `CodeData` at `ipc`.
    ///  - Returns: the word stored at index.
    mutating func readWord() -> Int {
        guard ipc < data.count - 1 else { fatalError("Data access out of bounds")}
        let word = Int(data[ipc]) | Int(data[ipc+1] << 8)
        self.ipc = self.ipc + 2
        return word
    }
    /// Get a word from  `CodeData` at `index`.
    ///  - Parameters:
    ///   - at: if `offset` is set, use this location instead of `ipc` and don't update `ipc` after.
    ///  - Returns: the word stored at index.
    mutating func readWord(at position: Int) -> Int {
        guard position < data.count - 1 else {
            fatalError("Reading word out of bounds at position $position)")
        }
        let word = Int(data[position]) | Int(data[position+1] << 8)
        return word
    }
    
    mutating func readAddress() -> Int {
        guard ipc < data.count else { fatalError("Data access out of bounds")}
        var dest: Int = 0
        let offset = Int(data[ipc])
        if offset > 0x7f {
            let jte = header + offset - 256
            dest = jte - self.data.readWord(at: jte)// find entry in jump table
        } else {
            dest = ipc + offset + 2
        }
        ipc += 1
        return dest
    }
    
    mutating func readString() -> String {
        let count = Int(data[ipc])
        ipc += 1
        guard ipc + count < data.count else {
            fatalError("Data access out of bounds")
        }

        let byteArray = Array(data[ipc..<ipc + count])
        ipc += count

        return String(bytes: byteArray, encoding: .ascii) ?? ""
    }
    
    mutating func readByteArray() -> [Int] {
        return []
    }
    /// Read word-aligned array of `count` words
    mutating func readWordArray(count: Int) -> [Int] {
        guard ipc + count * 2 < data.count else { fatalError("Data access out of bounds")}
        return []
    }
}
