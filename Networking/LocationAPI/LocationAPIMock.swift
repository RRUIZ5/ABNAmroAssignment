#if DEBUG
final class LocationAPIMock: LocationAPISpecs {
    private let mockedLocations: [Location]?

    init(mockedLocations: [Location]? = nil) {
        self.mockedLocations = mockedLocations
    }

    func fetchAllLocations() async throws -> [Location] {
        mockedLocations ?? [
            Location(name: "Amsterdam", lat: 52.3547498, long: 4.8339215),
            Location(name: "Mumbai", lat: 19.0823998, long: 72.8111468),
            Location(name: "Copenhagen", lat: 55.6713442, long: 12.523785),
            Location(name: nil, lat: 40.4380638, long: -3.7495758)
        ]
    }
}
#endif
