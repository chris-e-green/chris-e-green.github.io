struct Location: Hashable, CustomStringConvertible, Comparable, Codable {
    static func < (lhs: Location, rhs: Location) -> Bool {
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
    var segment: Int
    var procedure: Int?
    var lexLevel: Int?
    var addr: Int?
    var label: String?
    func hash(into hasher: inout Hasher) {
        hasher.combine(segment)
        hasher.combine(procedure)
        hasher.combine(lexLevel)
        hasher.combine(addr)
    }
    var description: String {
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
class ProcIdentifier: CustomStringConvertible, Hashable, Codable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(segmentNumber)
        hasher.combine(procNumber)
    }

    static func == (lhs: ProcIdentifier, rhs: ProcIdentifier) -> Bool {
        return lhs.segmentNumber == rhs.segmentNumber && lhs.procNumber == rhs.procNumber
    }

    internal init(
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

    var description: String {
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
    var shortDescription: String {
        return (segmentName ?? "SEG" + String(segmentNumber)) + "."
            + (procName ?? (isFunction ? "FUNC" : "PROC") + String(procNumber))
    }

    var isFunction: Bool
    var isAssembly: Bool = false
    var segmentNumber: Int
    var segmentName: String?
    var procNumber: Int
    var procName: String?
    var parameters: [LocInfo] = []
    var returnType: String
}

struct LocInfo: CustomStringConvertible, Hashable, Codable {
    var name: String
    var type: String
    var description: String {
        if type.isEmpty {
            return name
        } else {
            return "\(name):\(type)"
        }
    }
}

struct Call: CustomStringConvertible, Hashable, Codable {
    var description: String {
        return "From \(from.description) to \(to.description)"
    }
    var from: Location
    var to: Location
}
