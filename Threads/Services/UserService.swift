//
//  UserService.swift
//  Threads
//
//  Created by aykut ipek on 15.09.2023.
//

import Firebase
import FirebaseFirestoreSwift


final class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    init() {
        Task {
            try await fetchCurrentUser()
        }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        print("DEBUG: User is \(user)")
    }
    
    func reset() {
        self.currentUser = nil
    }
}
