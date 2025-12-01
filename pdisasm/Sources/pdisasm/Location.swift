public final class Location: Hashable, CustomStringConvertible, Comparable, Codable {
    public var segment: Int
    public var procedure: Int?
    public var lexLevel: Int?
    public var addr: Int?
    public var name: String
    public var type: String

    enum CodingKeys: String, CodingKey {
        case segment = "segment"
        case procedure = "procedure"
        case lexLevel = "lexLevel"
        case addr = "addr"
        case name = "name"
        case type = "type"
    }

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

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.segment = try container.decode(Int.self, forKey: CodingKeys.segment)
        self.procedure = try container.decodeIfPresent(Int.self, forKey: CodingKeys.procedure)
        self.lexLevel = try container.decodeIfPresent(Int.self, forKey: CodingKeys.lexLevel)
        self.addr = try container.decodeIfPresent(Int.self, forKey: CodingKeys.addr)
        self.name = try container.decode(String.self, forKey: CodingKeys.name)
        self.type = try container.decode(String.self, forKey: CodingKeys.type)
    }

    public init(segment: Int, procedure: Int? = nil, lexLevel: Int? = nil, addr: Int? = nil, 
                name: String = "", type: String = "") {
        self.segment = segment
        self.procedure = procedure
        self.lexLevel = lexLevel
        self.addr = addr
        self.name = name
        self.type = type
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.segment, forKey: CodingKeys.segment)
        try container.encode(self.procedure, forKey: CodingKeys.procedure)
        try container.encode(self.lexLevel, forKey: CodingKeys.lexLevel)
        try container.encode(self.addr, forKey: CodingKeys.addr)
        try container.encode(self.name, forKey: CodingKeys.name)
        try container.encode(self.type, forKey: CodingKeys.type)
    }

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
