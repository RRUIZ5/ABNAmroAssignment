import Foundation

final class LocationAPI: LocationAPISpecs {
    private let urlSession: URLSession
    private let locationsUrl = URL(string: "https://raw.githubusercontent.com/abnamrocoesd/assignment-ios/main/locations.json")!
    private let decoder = JSONDecoder()

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    func fetchAllLocations() async throws -> [Location] {
        let urlRequest = URLRequest(url: locationsUrl)
        let (data, response) = try await urlSession.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw LocationApIError.not200Response
        }

        return try decoder
            .decode(LocationResponse.self, from: data)
            .locations
    }
}

extension LocationAPI {
    enum LocationApIError: Error {
        case not200Response
    }
}
