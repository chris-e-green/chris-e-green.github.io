import Foundation

enum CodeDataError: Error {
    case unexpectedEndOfData
    case stringDecodingFailed
}

struct CodeData {
    let data: Data 
    var ipc: Int
    var header: Int
    
    init(data: Data, ipc: Int = 0, header: Int = 0) {
        self.data = data
        self.ipc = ipc
        self.header = header
    }
    
    /// Read a byte from `CodeData` at `ipc`, updating `ipc`.
    /// - Returns: The byte value as a UInt8.
    /// - Throws: `CodeDataError.unexpectedEndOfData` if the read goes past the end of the data.
    mutating func readByte() throws -> UInt8 {
        guard ipc < data.count else { throw CodeDataError.unexpectedEndOfData }
        let retval = data[ipc]
        ipc += 1
        return retval
    }
    
    /// Read and decode a 'BIG' value from `CodeData`, at `ipc`, updating `ipc`.
    /// - Returns: The decoded value.
    /// - Throws: `CodeDataError.unexpectedEndOfData` if the read goes past the end of the data.
    mutating func readBig() throws -> Int {
        let firstByte = try readByte()
        
        if firstByte <= 127 {
            return Int(firstByte)
        } else {
            // Check for the second byte before reading it.
            guard ipc < data.count else { throw CodeDataError.unexpectedEndOfData }
            let high = Int(firstByte & 0x7F)
            let low = data[ipc]
            ipc += 1
            return (high << 8) | Int(low)
        }
    }
 
    /// Get a word from `CodeData` at `ipc`, updating `ipc`.
    ///  - Returns: The little-endian word stored at the current location.
    /// - Throws: `CodeDataError.unexpectedEndOfData` if the read goes past the end of the data.
    mutating func readWord() throws -> UInt16 {
        guard ipc + 1 < data.count else { throw CodeDataError.unexpectedEndOfData }
        let low = UInt16(data[ipc])
        let high = UInt16(data[ipc + 1])
        ipc += 2
        return (high << 8) | low
    }
    
    /// Get a word from `CodeData` at a specific index without advancing `ipc`.
    ///  - Parameters:
    ///   - at: The position from which to read the word.
    ///  - Returns: The little-endian word stored at the index.
    /// - Throws: `CodeDataError.unexpectedEndOfData` if the read goes past the end of the data.
    func readWord(at position: Int) throws -> UInt16 {
        guard position >= 0 && position + 1 < data.count else { throw CodeDataError.unexpectedEndOfData }
        let low = UInt16(data[position])
        let high = UInt16(data[position + 1])
        return (high << 8) | low
    }

    /// Non-advancing byte read with bounds checking.
    func readByte(at position: Int) throws -> UInt8 {
        guard position >= 0 && position < data.count else { throw CodeDataError.unexpectedEndOfData }
        return data[position]
    }

    /// Non-advancing BIG read with bounds checking. Returns (value, byteCount).
    func readBig(at position: Int) throws -> (Int, Int) {
        guard position >= 0 && position < data.count else { throw CodeDataError.unexpectedEndOfData }
        let first = data[position]
        if first <= 127 {
            return (Int(first), 1)
        } else {
            guard position + 1 < data.count else { throw CodeDataError.unexpectedEndOfData }
            let val = Int(first & 0x7F) << 8 | Int(data[position + 1])
            return (val, 2)
        }
    }

    /// Non-advancing helper to read a self-referenced pointer at `position`.
    func getSelfRefPointer(at position: Int) throws -> Int {
        let w = try readWord(at: position)
        return position - Int(w)
    }
    
    /// Decodes a relative address offset, which can be a short jump or a long jump via a jump table.
    /// - Returns: The absolute destination address.
    /// - Throws: `CodeDataError` if any underlying read fails.
    mutating func readAddress() throws -> Int {
        let offset = try readByte()
        
        if offset > 0x7F {
            // Backwards jump: uses an offset from the header to find an entry in a jump table.
            let jte = header + Int(offset) - 256
            let jumpTableEntry = try self.readWord(at: jte)
            return jte - Int(jumpTableEntry)
        } else {
            // Forward jump: a simple relative offset from the current instruction pointer.
            return ipc + Int(offset) + 1 // ipc is already advanced by readByte()
        }
    }
    
    /// Reads a length-prefixed string.
    /// - Returns: The decoded string.
    /// - Throws: `CodeDataError` on failure.
    mutating func readString() throws -> String {
        let count = Int(try readByte())
        guard ipc + count <= data.count else { throw CodeDataError.unexpectedEndOfData }

        let stringData = data[ipc..<(ipc + count)]
        ipc += count
        
        guard let result = String(data: stringData, encoding: .ascii) else {
            throw CodeDataError.stringDecodingFailed
        }
        return result
    }
    
    /// Reads a length-prefixed byte array.
    mutating func readByteArray() throws -> [UInt8] {
        let count = Int(try readByte())
        guard ipc + count <= data.count else { throw CodeDataError.unexpectedEndOfData }
        let byteArray = Array(data[ipc..<ipc + count])
        ipc += count
        return byteArray
    }
    
    /// Reads a word-aligned array of `count` words.
    mutating func readWordArray(count: Int) throws -> [UInt16] {
        guard ipc + (count * 2) <= data.count else { throw CodeDataError.unexpectedEndOfData }
        var words: [UInt16] = []
        words.reserveCapacity(count)
        for _ in 0..<count {
            words.append(try readWord())
        }
        return words
    }
}