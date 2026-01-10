import Foundation

// MARK: - Stack Simulator

/// Manages the symbolic execution stack during P-code decoding
struct StackSimulator {
    let sep: Character = "~"
    var stack: [String] = []

    mutating func push(_ value: (String, String?)) {
        if let type = value.1 {
            stack.append("\(value.0)\(sep)\(type)")
        } else {
            stack.append("\(value.0)\(sep)UNKNOWN")
        }
    }

    mutating func pushReal(_ value: String) {
        stack.append("\(value)\(sep)REAL")
    }

    @discardableResult
    /// Pops the top of the stack and any datatype. If the type
    /// of the popped value is not defined, it uses the provided type
    /// and (if it refers to a memory location) corrects the type of
    /// the variable at that location.
    /// - Parameters:
    ///   - type: the type to use if the popped value is UNKNOWN
    ///   - withoutParentheses: whether to return the value without parentheses
    /// - Returns: a tuple of the popped value and its type (if any)
    mutating func pop(_ type: String, _ withoutParentheses: Bool = false) -> (String, String?) {
        let a = stack.popLast() ?? "underflow!"
        var parenthesized: String
        var locType: String
        if a.contains(sep) {  // typed value
            let parts = a.split(separator: sep, maxSplits: 1)
            let locName = String(parts[0])
            locType = String(parts[1])
            if locType == "UNKNOWN" {
                locType = type
            }
            if withoutParentheses {
                parenthesized = locName
            } else {
                parenthesized =
                    (locName.contains(" ") && locType != "STRING") ? "(\(locName))" : locName
            }
        } else {
            if withoutParentheses {
                parenthesized = a
            } else {
                parenthesized = a.contains(" ") ? "(\(a))" : a
            }
            locType = type
        }
        return (parenthesized, locType)
    }

    @discardableResult
    /// Pops the top of the stack and any datatype
    ///
    /// - Parameter withoutParentheses:
    /// - Returns: a tuple of the popped value and its type (if any)
    mutating func pop(_ withoutParentheses: Bool = false) -> (String, String?) {
        let a = stack.popLast() ?? "underflow!"
        if a.contains(sep) {  // typed value
            let parts = a.split(separator: sep, maxSplits: 1)
            if withoutParentheses {
                return (String(parts[0]), String(parts[1]))
            } else {
                let parenthesized =
                    (String(parts[0]).contains(" ") && parts[1] != "STRING")
                    ? "(\(parts[0]))" : String(parts[0])
                return (parenthesized, String(parts[1]))
            }
        } else {
            if withoutParentheses {
                return (a, nil)
            } else {
                let parenthesized = a.contains(" ") ? "(\(a))" : a
                return (parenthesized, nil)
            }
        }
    }

    @discardableResult
    /// Pops the top of the stack as a REAL value.
    /// - Returns: a tuple with the REAL value and the 'REAL' type
    mutating func popReal() -> (String, String?) {
        let a = stack.popLast() ?? "underflow!"
        if a.contains(sep) {
            let parts = a.split(separator: sep, maxSplits: 1)
            return (String(parts[0]), String(parts[1]))
        } else {
            let b = stack.popLast() ?? "underflow!"
            if let val1 = UInt16(a), let val2 = UInt16(b) {
                let fraction: UInt32 = UInt32(val1) | (UInt32(val2) & 0x007f) << 16
                let exponent = (val2 & 0x7f80) < 7
                let sign = (val2 & 0x8000) == 0x8000
                return ("\(sign == true  ? "-" : "")\(fraction)e\(exponent)", "REAL")
            } else {
                return ("\(a).\(b)", "REAL")
            }
        }
    }

    @discardableResult
    /// Pops the top of the stack as a SET value.
    /// - Returns: a tuple with the length of the set and its string representation
    mutating func popSet() -> (Int, String) {
        let (setLen, _) = self.pop()
        var setData: [String] = []
        var setVals: [Int] = []
        var prevElement: String = ""
        if let len = Int(setLen) {
            for i in 0..<len {
                let (element, _) = self.pop()
                if element.contains("{") == false {
                    if let value = UInt64(element) {
                        for j in 0..<16 {
                            if (value >> j) & 1 == 1 {
                                setVals.append(i * 16 + j)
                            }
                        }
                    } else {
                        setData.append(element)
                    }
                } else {
                    let elementParts = element.split(separator: "{")
                    if String(elementParts[0]) != prevElement {
                        prevElement = String(elementParts[0])
                        setData.append(String(elementParts[0]))
                    }
                }
            }
            if !setVals.isEmpty {
                while !setVals.isEmpty {
                    let first = setVals.first!
                    let group = setVals.prefix(while: {
                        $0 == setVals.first! + (setVals.firstIndex(of: $0)!)
                            - (setVals.firstIndex(of: first)!)
                    })
                    if group.count == 1 {
                        setData.append("\(group[0])")
                    } else {
                        setData.append("\(group.first!)...\(group.last!)")
                    }
                    setVals = Array(setVals.dropFirst(group.count))
                }
            }
            return (len, "[" + setData.joined(separator: ", ") + "]")
        }
        return (0, "malformed set!")
    }

    func snapshot() -> [String] {
        return stack
    }
}
