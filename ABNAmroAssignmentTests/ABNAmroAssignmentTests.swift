import Foundation
import Testing
@testable import ABNAmroAssignment

@MainActor
struct AssignmentNavigatorTests {

    @Test(arguments: AssignmentNavigatorTestCase.allCases)
    func `navigate(to:) opens the url that the destination expects`(testCase: AssignmentNavigatorTestCase) async throws {
        let urlOpenerMock = URLOpenerMock()
        let sut = AssignmentNavigator(urlOpener: urlOpenerMock)
        sut.navigate(to: testCase.destination)
        let expected: [URL?] = [testCase.expectedURL]

        #expect(urlOpenerMock.urls == expected)
    }

}

struct AssignmentNavigatorTestCase: CaseIterable {
    let destination: DeepLinkNavigatorDestination
    let expectedURL: URL?

    static let allCases = [
        AssignmentNavigatorTestCase(
            destination: .wikipedia(lat: 52.3547498, long: 4.8339215),
            expectedURL: URL(string: "wikipedia://places/?lat=52.3547498&long=4.8339215")
        ),
        AssignmentNavigatorTestCase(
            destination: .wikipedia(lat: 19.0823998, long: 72.8111468),
            expectedURL: URL(string: "wikipedia://places/?lat=19.0823998&long=72.8111468")
        ),
        AssignmentNavigatorTestCase(
            destination: .wikipedia(lat: 55.6713442, long: 12.523785),
            expectedURL: URL(string: "wikipedia://places/?lat=55.6713442&long=12.523785")
        ),
        AssignmentNavigatorTestCase(
            destination: .wikipedia(lat: 40.4380638, long: -3.7495758),
            expectedURL: URL(string: "wikipedia://places/?lat=40.4380638&long=-3.7495758")
        )
    ]
}
