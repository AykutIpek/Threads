//
//  ProfileViewModel.swift
//  Threads
//
//  Created by aykut ipek on 15.09.2023.
//

import Foundation
import Combine

final class ProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink {[weak self] user in
            self?.currentUser = user
            print("DEBUG: User in viewmodel from combine is \(String(describing: user))")
        }.store(in: &cancellables)
    }
    
}
