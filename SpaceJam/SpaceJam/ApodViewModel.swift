import Foundation
import Observation

@Observable
@MainActor
class ApodViewModel {
    let networkService: NetworkServiceProtocol
    var apod: Apod?

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func fetchApod() async {
        let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=SlLKwcIfgJ2PyHg4fZAFyL830FcCcjjNY8F8mPH4")!
        do {
            apod = try await networkService.fetch(url: url)
        } catch {
            print("Error fetching or decoding APOD: \(error)")
        }
    }
}
