import SwiftUI
import MapKit

struct CustomLocationView: View {
    private let viewModel: CustomLocationViewModel
    @State private var selectedCoordinate: CLLocationCoordinate2D?

    init(viewModel: CustomLocationViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        ZStack {
            MapReader { reader in
                Map {
                    if let selectedCoordinate {
                        Marker(coordinate: selectedCoordinate) {
                            Text("Selected")
                        }
                    }
                }
                .onTapGesture { screenCoord in
                    selectedCoordinate = reader.convert(screenCoord, from: .local)
                }
            }
            VStack {
                Button("Go to wikipedia") {
                    guard let selectedCoordinate else { return }
                    viewModel.onSelected(coordinate: selectedCoordinate)
                }
                .padding()
                .background(Color(UIColor.systemBackground))
                .clipShape(Capsule())
                .opacity(selectedCoordinate == nil ? 0 : 1)
                Spacer()
            }
            VStack {
                Text("Tap on the map to select a location")
                .clipShape(Capsule())
                .opacity(selectedCoordinate == nil ? 1 : 0)
                Spacer()
            }
        }
    }
}

#Preview {
    CustomLocationView(
        viewModel: CustomLocationViewModel(
            navigator: AssignmentNavigator(urlOpener: URLOpenerMock())
        )
    )
}
