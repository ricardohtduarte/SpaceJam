import NeoNetwork
import Combine

class PictureOfTheDayViewModel {
    private let neoNetwork: NeoNetworkProtocol
    private var subscriptions: Set<AnyCancellable> = .init()

    @Published var title: String = ""
    @Published var explanation: String = ""

    init(neoNetwork: NeoNetworkProtocol = NeoNetwork()) {
        self.neoNetwork = neoNetwork
        fetchPictureOfTheDay()
    }

    private func fetchPictureOfTheDay() {
        guard let url = NasaEndpoint.pictureOfTheDay.url else {
            return
        }
        neoNetwork.fetch(from: url)
            .sink(
                receiveCompletion: {_ in },
                receiveValue: { [weak self] (pictureOfTheDay: PictureOfTheDay) in
                    self?.title = pictureOfTheDay.title
                    self?.explanation = pictureOfTheDay.explanation
                }
            ).store(in: &subscriptions)
    }
}
