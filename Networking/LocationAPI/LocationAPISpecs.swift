protocol LocationAPISpecs {
    func fetchAllLocations() async throws -> [Location]
}
