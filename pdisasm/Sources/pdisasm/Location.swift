public struct Location: Hashable, CustomStringConvertible, Comparable, Codable {


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
    public var label: String?
    public func hash(into hasher: inout Hasher) {
        hasher.combine(segment)
        hasher.combine(procedure)
        hasher.combine(lexLevel)
        hasher.combine(addr)
    }

    // init?(stringValue: String) {
    //   let v = stringValue.split(separator:"_", maxSplits:5, omittingEmptySubsequences: false)
    //   self.segment = Int(v[0])
    //   self.procedure = Int(v[1])
    //   self.lexLevel = Int(v[2])
    //   self.addr = Int(v[3])
    //   self.label = String(v[4])
    // }

    // init?(codingKey: CodingKey) {
	// self.segment = 0	
    // }

    // public var codingKey: CodingKey {
    //   return Location(stringValue: "\(segment)_\(procedure)_\(lexLevel)_\(addr)_\(label)")
    // }

    public var description: String {
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

}

public class ProcIdentifier: CustomStringConvertible, Hashable, Codable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(segmentNumber)
        hasher.combine(procNumber)
    }

    public static func == (lhs: ProcIdentifier, rhs: ProcIdentifier) -> Bool {
        return lhs.segmentNumber == rhs.segmentNumber && lhs.procNumber == rhs.procNumber
    }

    public init(
        isFunction: Bool, isAssembly: Bool = false, segmentNumber: Int, segmentName: String? = nil,
        procNumber: Int, procName: String? = nil, parameters: [LocInfo] = [],
        returnType: String = "UNKNOWN"
    ) {
        self.isFunction = isFunction
        self.isAssembly = isAssembly
        self.segmentNumber = segmentNumber
        self.segmentName = segmentName
        self.procNumber = procNumber
        self.procName = procName
        self.parameters = parameters
        self.returnType = returnType
    }

    public var description: String {
        var s =
            (isFunction
            ? "FUNCTION "
            : "PROCEDURE ") + (segmentName ?? "SEG" + String(segmentNumber)) + "."
                + (procName ?? (isFunction ? "FUNC" : "PROC") + String(procNumber))
        if !parameters.isEmpty {
            s += "(" + parameters.map({ $0.description }).joined(separator: "; ") + ")"
        }
        if isFunction {
            s += ": " + returnType
        }
        return s
    }
    public var shortDescription: String {
        var result = ""
        if segmentName == nil || segmentName!.isEmpty {
            result += "SEG" + String(segmentNumber)
        } else {
            result += segmentName!
        }
        result += "."
        if procName == nil || procName!.isEmpty {
            result += (isFunction ? "FUNC" : "PROC") + String(procNumber)
        } else {
            result += procName!
        }
        return result
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.segmentNumber = try container.decode(Int.self, forKey: CodingKeys.segmentNumber)
        self.procNumber = try container.decode(Int.self, forKey: CodingKeys.procNumber)
        self.segmentName = try container.decodeIfPresent(String.self, forKey: CodingKeys.segmentName)
        self.procName = try container.decodeIfPresent(String.self, forKey: CodingKeys.procName)
        let paramStr = try container.decode(String.self, forKey: CodingKeys.parameters)
        self.parameters = paramStr.split(separator: ";").map {
            let parts = $0.split(separator: ":", maxSplits: 1).map { String($0) }
            if parts.count == 2 {
                return LocInfo(name: parts[0], type: parts[1])
            } else {
                return LocInfo(name: parts[0], type: "")
            }
        }
        self.returnType = try container.decode(String.self, forKey: CodingKeys.returnType)
        self.isAssembly = try container.decode(Bool.self, forKey: CodingKeys.isAssembly)
        self.isFunction = try container.decode(Bool.self, forKey: CodingKeys.isFunction)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.segmentNumber, forKey: CodingKeys.segmentNumber)
        try container.encode(self.procNumber, forKey: CodingKeys.procNumber)
        try container.encode(self.segmentName, forKey: CodingKeys.segmentName)
        try container.encode(self.procName, forKey: CodingKeys.procName)
        try container.encode(self.parameters.map { $0.description}.joined(separator:";"), forKey: CodingKeys.parameters)
        try container.encode(self.returnType, forKey: CodingKeys.returnType)
        try container.encode(self.isAssembly, forKey: CodingKeys.isAssembly)
        try container.encode(self.isFunction, forKey: CodingKeys.isFunction)
    }
    enum CodingKeys: String, CodingKey {
        case segmentNumber = "segmentNumber"
        case procNumber = "procNumber"
        case segmentName = "segmentName"
        case procName = "procName"
        case parameters = "parameters"
        case returnType = "returnType"
        case isAssembly = "isAssembly"
        case isFunction = "isFunction"

    }
    public var isFunction: Bool
    public var isAssembly: Bool = false
    public var segmentNumber: Int
    public var segmentName: String?
    public var procNumber: Int
    public var procName: String?
    public var parameters: [LocInfo] = []
    public var returnType: String
}

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

public struct LocInfo: CustomStringConvertible, Hashable, Codable, Sendable {
    public var name: String
    public var type: String
    public var description: String {
        if type.isEmpty {
            return name
        } else {
            return "\(name):\(type)"
        }
    }

    public init(name: String, type: String) {
        self.name = name
        self.type = type
    }
}

public struct Call: CustomStringConvertible, Hashable, Codable {
    public var description: String {
        return "From \(origin.description) to \(target.description)"
    }
    public var origin: Location
    public var target: Location

    public init(from: Location, to: Location) {
        self.origin = from
        self.target = to
    }
}
