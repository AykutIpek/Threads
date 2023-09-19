//
//  CreateThreadViewModel.swift
//  Threads
//
//  Created by aykut ipek on 19.09.2023.
//

import Foundation
import Firebase

final class CreateThreadViewModel: ObservableObject {
    
    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let thread = Thread(ownerUid: uid, caption: caption, timeStamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(thread)
    }
}
