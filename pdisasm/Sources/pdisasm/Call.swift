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
