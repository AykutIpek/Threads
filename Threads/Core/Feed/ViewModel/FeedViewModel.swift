//
//  FeedViewModel.swift
//  Threads
//
//  Created by aykut ipek on 19.09.2023.
//

import Foundation


final class FeedViewModel: ObservableObject {
    @Published var threads = [Thread]()
    
    init(){
        Task { try await fetchThreads() }
    }
    
    @MainActor
    func fetchThreads() async throws {
        self.threads = try await ThreadService.fetchThreads()
    }
}
