import Foundation

struct Apod: Codable {
    let copyright: String?
    let date: String
    let explanation: String
    let hdurl: String
    let mediaType: String
    let serviceVersion: String
    let title: String
    let url: String
}
