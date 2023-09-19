//
//  UserContentListViewModel.swift
//  Threads
//
//  Created by aykut ipek on 19.09.2023.
//

import Foundation


final class UserContentListViewModel: ObservableObject {
    let user: User
    @Published var threads = [Thread]()
    
    init(user: User) {
        self.user = user
    }
    
    @MainActor
    func fetchUserThreads() async throws {
        var threads = try await ThreadService.fetchUserThreads(uid: user.id)
        
        for i in 0 ..< threads.count {
            threads[i].user = self.user
        }
        
        self.threads = threads
    }
}
