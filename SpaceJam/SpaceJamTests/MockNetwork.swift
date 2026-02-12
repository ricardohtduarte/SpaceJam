import Foundation
@testable import SpaceJam

class MockNetworkService: NetworkServiceProtocol {
    var fetchHandler: ((URL) throws -> Any)?

    func fetch<T: Codable>(url: URL) async throws -> T {
        if let handler = fetchHandler {
            let result = try handler(url)
            if let typedResult = result as? T {
                return typedResult
            } else {
                throw NSError(domain: "MockNetworkServiceError", code: 2, userInfo: [NSLocalizedDescriptionKey: "Type mismatch in mock handler."])
            }
        }
        throw NSError(domain: "MockNetworkServiceError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Fetch handler not set."])
    }
}
