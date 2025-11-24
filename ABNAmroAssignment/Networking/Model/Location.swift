struct Location: Codable, Identifiable, Hashable {
    let name: String?
    let lat: Double
    let long: Double

    var displayName: String {
        name ?? id
    }
    var id: String {
        "\(lat),\(long)" // a better id is needed
    }
    var accessibilityLabel: String {
        name ?? "\(lat.roundTwoDecimals()), \(long.roundTwoDecimals())"
    }
}
