//
//  DataExtensions.swift
//  PascalDisassembler
//
//  Created by Christopher Green on 24/9/2025.
//
import Foundation

extension Data {
    
    /// Returns 512-byte blocks from `Data`.
    /// - Parameters:
    ///   - blockNum: the starting block number.
    ///   - length: the number of bytes to return.
    /// - Returns: A `Data` object of `length` bytes, starting at block `blockNum`.
    func getCodeBlock(at blockNum:Int, length:Int) -> Data {
        return self.subdata(in: Int(blockNum)*512..<(Int(blockNum)*512)+Int(length))
    }
    
    /// Read and decode a 'BIG' value from `Data`. Also returns the number of bytes used to store the value.
    /// - Parameters:
    ///   - index: the offset where the BIG value starts.
    /// - Returns: a tuple containing the decoded value and byte length.
    func readBig(at index: Int) -> (Int, Int) {
        var retval: Int = 0
        var indexInc = 0
        if self[index] <= 127 {
            retval = Int(self[index])
            indexInc = 1
        } else {
            retval = Int(self[index] - 128) << 8 | Int(self[index+1])
            indexInc = 2
        }
        return (retval, indexInc)
    }
    
    /// Get a word from `Data`.
    ///  - Parameters:
    ///    - index: the offset where the word value starts.
    ///  - Returns: the word stored at index.
    func readWord(at index: Int) -> Int {
        return Int(self[index]) | Int(self[index+1]) << 8
    }
    
    /// Get the absolute location referenced in a self-referenced pointer in `Data`.
    ///   - Parameters:
    ///     - at: the offset of the self-referenced pointer
    ///   - Returns: the absolute pointer corresponding to the self-referenced pointer.
    func getSelfRefPointer(at index: Int) -> Int {
        let ptrLocation = index
        return ptrLocation - readWord(at: ptrLocation)
    }
}

