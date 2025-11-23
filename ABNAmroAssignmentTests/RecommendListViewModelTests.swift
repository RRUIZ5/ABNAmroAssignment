@testable import ABNAmroAssignment
import Testing

@MainActor
struct RecommendListViewModelTests {
    @Test func `onSelected(location:) navigates to the expected destination`() async throws {
        let navigatorMock = DeepLinkNavigatorMock()
        let sut = RecommendListViewModel(
            api: LocationAPIMock(),
            navigator: navigatorMock
        )
        sut.onSelected(location: Location(name: "test", lat: 12.11, long: 12.11))
        let actualDestination = try #require(navigatorMock.destinations.first)
        let expectedDestination: DeepLinkNavigatorDestination = .wikipedia(
            lat: 12.11,
            long: 12.11
        )

        #expect(actualDestination == expectedDestination)
    }

    @Test func `sut exposes loaded data through .locations`() async throws {
        let navigatorMock = DeepLinkNavigatorMock()
        let sut = RecommendListViewModel(
            api: LocationAPIMock(),
            navigator: navigatorMock
        )
        await Task.yield() // let other tasks continue first
        #expect(!sut.locations.isEmpty)
    }

}
