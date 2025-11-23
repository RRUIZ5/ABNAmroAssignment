import CoreLocation

final class CustomLocationViewModel {
    func onSelected(coordinate: CLLocationCoordinate2D) {
        print(coordinate.latitude, coordinate.longitude)
    }
}
