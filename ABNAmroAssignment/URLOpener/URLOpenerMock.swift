#if DEBUG
import Foundation
import UIKit

final class URLOpenerMock: URLOpener {
    private(set) var urls: [URL] = []

    func open(url: URL) {
        urls.append(url)
    }
}
#endif
