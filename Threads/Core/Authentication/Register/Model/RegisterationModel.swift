//
//  RegisterationModel.swift
//  Threads
//
//  Created by aykut ipek on 12.09.2023.
//

import Foundation


struct RegisterModel: Codable {
    var email: String = ""
    var username: String = ""
    var fullName: String = ""
    var password: String = ""
}
