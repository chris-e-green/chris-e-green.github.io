public class ProcIdentifier: CustomStringConvertible, Hashable, Codable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(segment)
        hasher.combine(procedure)
    }

    public static func == (lhs: ProcIdentifier, rhs: ProcIdentifier) -> Bool {
        return lhs.segment == rhs.segment && lhs.procedure == rhs.procedure
    }

    public init(
        isFunction: Bool, isAssembly: Bool = false, segment: Int, segmentName: String? = nil,
        procedure: Int, procName: String? = nil, parameters: [Identifier] = [],
        returnType: String? = nil 
    ) {
        self.isFunction = isFunction
        self.isAssembly = isAssembly
        self.segment = segment
        self.segmentName = segmentName
        self.procedure = procedure
        self.procName = procName
        self.parameters = parameters
        if isFunction {
            self.returnType = returnType ?? "UNKNOWN"
        }
    }

    public var description: String {
        var s =
            (isFunction
            ? "FUNCTION "
            : "PROCEDURE ") + (segmentName ?? "SEG" + String(segment)) + "."
                + (procName ?? (isFunction ? "FUNC" : "PROC") + String(procedure))
        if !parameters.isEmpty {
            s += "(" + parameters.map({ $0.description }).joined(separator: "; ") + ")"
        }
        if isFunction {
            s += ": " + (returnType ?? "UNKNOWN")
        }
        return s
    }
    public var shortDescription: String {
        var result = ""
        if segmentName == nil || segmentName!.isEmpty {
            result += "SEG" + String(segment)
        } else {
            result += segmentName!
        }
        result += "."
        if procName == nil || procName!.isEmpty {
            result += (isFunction ? "FUNC" : "PROC") + String(procedure)
        } else {
            result += procName!
        }
        return result
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.segment = try container.decode(Int.self, forKey: CodingKeys.segmentNumber)
        self.procedure = try container.decode(Int.self, forKey: CodingKeys.procNumber)
        self.segmentName = try container.decodeIfPresent(String.self, forKey: CodingKeys.segmentName)
        self.procName = try container.decodeIfPresent(String.self, forKey: CodingKeys.procName)
        let paramStr = try container.decode(String.self, forKey: CodingKeys.parameters)
        self.parameters = paramStr.split(separator: ";").map {
            let parts = $0.split(separator: ":", maxSplits: 1).map { String($0) }
            if parts.count == 2 {
                return Identifier(name: parts[0], type: parts[1])
            } else {
                return Identifier(name: parts[0], type: "")
            }
        }
        self.returnType = try container.decode(String.self, forKey: CodingKeys.returnType)
        self.isAssembly = try container.decode(Bool.self, forKey: CodingKeys.isAssembly)
        self.isFunction = try container.decode(Bool.self, forKey: CodingKeys.isFunction)
        if !self.isFunction {
            self.returnType = nil
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.segment, forKey: CodingKeys.segmentNumber)
        try container.encode(self.procedure, forKey: CodingKeys.procNumber)
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
    public var segment: Int
    public var segmentName: String?
    public var procedure: Int
    public var procName: String?
    public var parameters: [Identifier] = []
    public var returnType: String?
}
