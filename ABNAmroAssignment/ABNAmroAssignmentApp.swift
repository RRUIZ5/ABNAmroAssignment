import SwiftUI
import UIKit

@main
struct ABNAmroAssignmentApp: App {
    var body: some Scene {
        // deepLinkNavigator has to be placed inside `body` otherwise
        // I get a very interesting exception where UIApplication.shared is nil
        let deepLinkNavigator: DeepLinkNavigator = AssignmentNavigator(urlOpener: UIApplication.shared)
        WindowGroup {
            TabView {
                Tab("Recommended locations", systemImage: "list.bullet") {
                    RecommendedListView(
                        viewModel: RecommendListViewModel(
                            navigator: deepLinkNavigator
                        )
                    )
                }
                Tab("Custom location", systemImage: "globe") {
                    CustomLocationView(
                        viewModel: CustomLocationViewModel(
                            navigator: deepLinkNavigator
                        )
                    )
                }
            }
        }
    }
}
