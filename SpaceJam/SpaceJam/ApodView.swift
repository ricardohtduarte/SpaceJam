import SwiftUI

struct ApodView: View {
    @State private var viewModel = ApodViewModel()

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

#Preview {
    ApodView()
}
