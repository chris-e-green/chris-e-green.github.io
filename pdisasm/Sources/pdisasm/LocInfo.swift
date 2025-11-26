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
