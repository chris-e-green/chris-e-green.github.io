public struct Call: CustomStringConvertible, Hashable, Codable {
    public static func == (lhs: Call, rhs: Call) -> Bool {
        return lhs.origin == rhs.origin && lhs.target == rhs.target
    }

    public var description: String {
        return "From \(origin.description) to \(target.description)"
    }
    public var origin: Location
    public var target: Location

    public func hash(into hasher: inout Hasher) {
        hasher.combine(origin)
        hasher.combine(target)
    }
    public init(from: Location, to: Location) {
        self.origin = from
        self.target = to
    }
}
