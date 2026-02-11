//
//  ContentView.swift
//  SpaceJam
//
//  Created by ricardo.duarte on 06/02/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ApodView(viewModel: ApodViewModel(networkService: NetworkService()))
    }
}

#Preview {
    ContentView()
}
