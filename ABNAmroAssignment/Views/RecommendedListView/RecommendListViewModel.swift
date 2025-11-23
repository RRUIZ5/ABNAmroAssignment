import Observation
import Foundation

@Observable
final class RecommendListViewModel {
    private let api: LocationAPISpecs
    var locations: [Location] = []

    init(api: LocationAPISpecs = LocationAPI()) {
        self.api = api
        Task { await load() }
    }

    private func load() async {
        let locations = try? await api.fetchAllLocations()
        self.locations = locations ?? []
    }

    func onSelected(location: Location) {
        print(location)
    }
}
