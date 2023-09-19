//
//  ThreadService.swift
//  Threads
//
//  Created by aykut ipek on 19.09.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


struct ThreadService {
    
    static func uploadThread(_ thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        let ref = try await Firestore.firestore().collection("threads").addDocument(data: threadData)
        
    }
}
