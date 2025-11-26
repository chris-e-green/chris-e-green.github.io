public struct Location: Hashable, CustomStringConvertible, Comparable, Codable, Sendable {
    public static func < (lhs: Location, rhs: Location) -> Bool {
        if lhs.segment != rhs.segment {
            return lhs.segment < rhs.segment
        }
        if lhs.procedure != rhs.procedure {
            return (lhs.procedure ?? -1) < (rhs.procedure ?? -1)
        }
        if lhs.lexLevel != rhs.lexLevel {
            return (lhs.lexLevel ?? -1) < (rhs.lexLevel ?? -1)
        }
        return (lhs.addr ?? -1) < (rhs.addr ?? -1)
    }
    
    public var segment: Int
    public var procedure: Int?
    public var lexLevel: Int?
    public var addr: Int?
    public var name: String
    public var type: String
    
    public init(segment: Int, procedure: Int? = nil, lexLevel: Int? = nil, addr: Int? = nil, 
                name: String = "", type: String = "") {
        self.segment = segment
        self.procedure = procedure
        self.lexLevel = lexLevel
        self.addr = addr
        self.name = name
        self.type = type
    }
    
    // Equality and hashing exclude name/type to match LocationTwo behavior
    public static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.segment == rhs.segment &&
            lhs.procedure == rhs.procedure &&
            lhs.lexLevel == rhs.lexLevel &&
            lhs.addr == rhs.addr
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(segment)
        hasher.combine(procedure)
        hasher.combine(lexLevel)
        hasher.combine(addr)
    }

    public var description: String {
        if !name.isEmpty {
            return "\(name):\(type)"
        }
        var locationString = "S\(segment)"
        if let procedure = procedure {
            locationString += "_P\(procedure)"
        }
        if let lexLevel = lexLevel {
            locationString += "_L\(lexLevel)"
        }
        if let addr = addr {
            locationString += "_A\(addr)"
        }
        return locationString
    }
    
    public var longDescription: String {
        var s = "S\(segment)"
        if let procedure = procedure {
            s.append("_P\(procedure)")
        }
        if let lexLevel = lexLevel {
            s.append("_L\(lexLevel)")
        }
        if let addr = addr {
            s.append("_A\(addr)")
        }
        if !name.isEmpty {
            s.append("_\(name):\(type)")
        }
        return s
    }

}
