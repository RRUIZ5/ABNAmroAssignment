import CoreLocation

final class CustomLocationViewModel {
    private let navigator: DeepLinkNavigator

    init(navigator: DeepLinkNavigator) {
        self.navigator = navigator
    }

    func onSelected(coordinate: CLLocationCoordinate2D) {
        navigator.navigate(
            to: .wikipedia(lat: coordinate.latitude, long: coordinate.longitude)
        )
    }
}
