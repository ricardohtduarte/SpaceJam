import SwiftUI

struct ApodView: View {
    @State private var viewModel: ApodViewModel

    init(viewModel: ApodViewModel) {
        self._viewModel = State(wrappedValue: viewModel)
    }

    var body: some View {
        AsyncImage(url: URL(string: "https://apod.nasa.gov/apod/image/2602/greencompany_rive_960.jpg")) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            ProgressView()
        }
    }
}
