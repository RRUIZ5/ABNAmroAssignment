protocol DeepLinkNavigator {
    func navigate(to destination: DeepLinkNavigatorDestination)
}

enum DeepLinkNavigatorDestination: Equatable {
    case wikipedia(lat: Double, long: Double)
}
