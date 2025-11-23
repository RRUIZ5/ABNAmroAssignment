import Foundation
import UIKit

final class AssignmentNavigator: DeepLinkNavigator {
    let urlOpener: URLOpener

    init(urlOpener: URLOpener) {
        self.urlOpener = urlOpener
    }

    func navigate(to route: DeepLinkNavigatorDestination) {
        urlOpener.open(url: baseURL(for: route))
    }

    private func baseURL(for route: DeepLinkNavigatorDestination) -> URL {
        switch route {
        case .wikipedia(let lat, let long):
            var components = URLComponents(
                url: .wikipediaDeepLink,
                resolvingAgainstBaseURL: true
            )

            components?.queryItems = [
                URLQueryItem(name: "lat", value: String(lat)),
                URLQueryItem(name: "long", value: String(long))
            ]

            return components?.url ?? .wikipediaDeepLink
        }
    }
}
