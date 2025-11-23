import Foundation
import UIKit

protocol URLOpener {
    func open(url: URL)
}

extension UIApplication: URLOpener {
    func open(url: URL) {
        open(url, options: [:], completionHandler: nil)
    }
}
