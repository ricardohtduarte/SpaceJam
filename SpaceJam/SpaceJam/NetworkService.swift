import Foundation

protocol NetworkServiceProtocol {
    func fetch<T: Codable>(url: URL) async throws -> T
}

class NetworkService: NetworkServiceProtocol {
    func fetch<T: Codable>(url: URL) async throws -> T {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            print("Error fetching or decoding APOD: \(error)")
            throw error
        }
    }
}

