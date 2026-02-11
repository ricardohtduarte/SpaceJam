//
//  SpaceJamTests.swift
//  SpaceJamTests
//
//  Created by ricardo.duarte on 11/02/2026.
//

import Testing
@testable import SpaceJam

@MainActor
struct ApodViewModelTests {
    @Test func testNetworkIsInitialised() async throws {
        let mockNetworkService = MockNetworkService()
        mockNetworkService.fetchHandler = { _ in
            Apod(
                copyright: nil,
                date: "2026-02-11",
                explanation: "Test Explanation",
                hdurl: "https://example.com/hd.jpg",
                mediaType: "image",
                serviceVersion: "v1",
                title: "Test Title",
                url: "https://example.com/test.jpg"
            )
        }

        let viewModel = ApodViewModel(networkService: mockNetworkService)
        await viewModel.fetchApod()
        #expect(viewModel.apod?.title == "Test Title")
    }
}
