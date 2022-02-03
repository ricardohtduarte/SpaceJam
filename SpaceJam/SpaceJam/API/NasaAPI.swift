import Foundation
import NeoNetwork

enum NasaEndpoint {
    case pictureOfTheDay
}

extension NasaEndpoint: NeoEndpoint {
    var httpScheme: HTTPScheme {
        .https
    }

    var host: String {
        "api.nasa.gov"
    }

    var path: String {
        "/planetary/apod"
    }

    var queryItems: [URLQueryItem] {
        [
            .init(name: "api_key", value: "SlLKwcIfgJ2PyHg4fZAFyL830FcCcjjNY8F8mPH4")
        ]
    }

    var httpMethod: HTTPMethod {
        .get
    }
}
