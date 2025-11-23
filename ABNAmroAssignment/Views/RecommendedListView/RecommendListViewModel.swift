import Observation
import Foundation

@Observable
final class RecommendListViewModel {
    private let api: LocationAPISpecs
    private let navigator: DeepLinkNavigator
    var locations: [Location] = []

    init(
        api: LocationAPISpecs = LocationAPI(),
        navigator: DeepLinkNavigator
    ) {
        self.api = api
        self.navigator = navigator
        Task { await load() }
    }

    private func load() async {
        let locations = try? await api.fetchAllLocations()
        self.locations = locations ?? []
    }

    func onSelected(location: Location) {
        navigator.navigate(
            to: .wikipedia(lat: location.lat, long: location.long)
        )
    }
}
