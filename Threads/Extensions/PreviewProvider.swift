//
//  PreviewProvider.swift
//  Threads
//
//  Created by aykut ipek on 15.09.2023.
//

import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}


final class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Max Verstappen", email: "max@gmail.com", username: "maxverstappen1")
}
