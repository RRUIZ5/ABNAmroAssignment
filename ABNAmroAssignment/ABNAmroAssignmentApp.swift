import SwiftUI

@main
struct ABNAmroAssignmentApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                Tab("Recommended locations", systemImage: "list.bullet") {
                    RecommendedListView(viewModel: RecommendListViewModel())
                }
                Tab("Custom location", systemImage: "globe") {
                    CustomLocationView(viewModel: CustomLocationViewModel())
                }
            }
        }
    }
}
