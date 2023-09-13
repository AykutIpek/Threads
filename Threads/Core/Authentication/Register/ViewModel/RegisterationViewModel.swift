//
//  RegisterationViewModel.swift
//  Threads
//
//  Created by aykut ipek on 12.09.2023.
//

import Foundation


final class RegisterationViewModel: ObservableObject {
    @Published var model = RegisterModel()
    
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: model.email,
                                                password: model.password,
                                                fullName: model.fullName,
                                                userName: model.username)
    }
}
