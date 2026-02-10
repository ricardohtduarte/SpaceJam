import Foundation
import Observation

@Observable
@MainActor
class ApodViewModel {
    var apod: Apod?

    init() {
        Task {
            await fetchApod()
        }
    }

    func fetchApod() async {
        let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=SlLKwcIfgJ2PyHg4fZAFyL830FcCcjjNY8F8mPH4")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            apod = try decoder.decode(Apod.self, from: data)
        } catch {
            print("Error fetching or decoding APOD: \(error)")
        }
    }
}
