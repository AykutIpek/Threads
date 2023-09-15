//
//  ExploreViewModel.swift
//  Threads
//
//  Created by aykut ipek on 15.09.2023.
//

import Foundation


final class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task {
            try await fetchUsers()
        }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
