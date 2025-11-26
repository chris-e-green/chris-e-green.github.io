public struct LocationTwo: CustomStringConvertible, Comparable, Hashable, Codable {
    public static func < (lhs: LocationTwo, rhs: LocationTwo) -> Bool {
        if lhs.segment != rhs.segment {
            return lhs.segment < rhs.segment
        }
        if lhs.procedure != rhs.procedure {
            return (lhs.procedure ?? -1) < (rhs.procedure ?? -1)
        }
        if lhs.lexLevel != rhs.lexLevel {
            return (lhs.lexLevel ?? -1) < (rhs.lexLevel ?? -1)
        }
        return lhs.addr < rhs.addr
    }

    public var segment: Int
    public var procedure: Int?
    public var lexLevel: Int?
    public var addr: Int
    public var name: String
    public var type: String

    public static func == (lhs: LocationTwo, rhs: LocationTwo) -> Bool {
        return lhs.segment == rhs.segment &&
            lhs.procedure == rhs.procedure &&
            lhs.lexLevel == rhs.lexLevel &&
            lhs.addr == rhs.addr
    }

    public var description: String {
        if !name.isEmpty { return "\(name):\(type)"}
        var s = "S\(segment)"
        if let procedure = procedure {
            s.append("_P\(procedure)")
        }
        if let lexLevel = lexLevel {
            s.append("_L\(lexLevel)")
        }
        s.append("_A\(addr)")
        return s
    }
    public var longDescription: String {
        var s = "S\(segment)"
        if let procedure = procedure {
            s.append("_P\(procedure)")
        }
        if let lexLevel = lexLevel {
            s.append("_L\(lexLevel)")
        }
        s.append("_A\(addr)_\(name):\(type)")
        return s
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(segment)
        hasher.combine(procedure)
        hasher.combine(lexLevel)
        hasher.combine(addr)
    }
}
