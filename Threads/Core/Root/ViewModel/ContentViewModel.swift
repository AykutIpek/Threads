//
//  ContentViewModel.swift
//  Threads
//
//  Created by aykut ipek on 15.09.2023.
//

import Combine
import Firebase


final class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
    }
}
