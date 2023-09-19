//
//  Thread.swift
//  Threads
//
//  Created by aykut ipek on 19.09.2023.
//

import Firebase
import FirebaseFirestoreSwift

struct Thread: Identifiable, Codable {
    @DocumentID var threadId: String?
    let ownerUid: String
    let caption: String
    let timeStamp: Timestamp
    
    var id: String {
        return threadId ?? NSUUID().uuidString
    }
    var likes: Int
    
    var user: User?
}
