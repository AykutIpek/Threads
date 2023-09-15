//
//  User.swift
//  Threads
//
//  Created by aykut ipek on 15.09.2023.
//

import Foundation


struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
