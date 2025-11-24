import SwiftUI

struct RecommendedListView: View {
    private let viewModel: RecommendListViewModel

    init(viewModel: RecommendListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Text("Tap on a location to open Wikipedia")
                .font(.title)

            List(viewModel.locations) { location in
                Text(location.displayName)
                    .onTapGesture {
                        viewModel.onSelected(location: location)
                    }
                    .accessibilityLabel(location.accessibilityLabel)
            }
            .listStyle(.plain)
        }
        .padding()
    }
}

#Preview {
    RecommendedListView(
        viewModel: RecommendListViewModel(
            api: LocationAPIMock(),
            navigator: AssignmentNavigator(urlOpener: URLOpenerMock())
        )
    )
}
