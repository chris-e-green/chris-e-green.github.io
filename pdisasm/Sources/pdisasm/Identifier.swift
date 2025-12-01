public struct Identifier: CustomStringConvertible, Hashable, Codable, Sendable {
    public static func == (lhs: Identifier, rhs: Identifier) -> Bool {
        return lhs.name == rhs.name && lhs.type == rhs.type
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(type)
    }
    
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
