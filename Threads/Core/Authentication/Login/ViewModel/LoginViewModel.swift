//
//  LoginViewModel.swift
//  Threads
//
//  Created by aykut ipek on 12.09.2023.
//

import Foundation


final class LoginViewModel: ObservableObject {
    @Published var model = LoginModel()
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(withEmail: model.email, password: model.password)
    }
}
