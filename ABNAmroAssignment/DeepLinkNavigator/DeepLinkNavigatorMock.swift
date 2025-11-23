#if DEBUG
final class DeepLinkNavigatorMock: DeepLinkNavigator {
    private(set) var destinations: [DeepLinkNavigatorDestination] = []
    func navigate(to destination: DeepLinkNavigatorDestination) {
        destinations.append(destination)
    }
}
#endif
