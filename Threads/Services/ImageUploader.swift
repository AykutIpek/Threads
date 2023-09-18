//
//  ImageUploader.swift
//  Threads
//
//  Created by aykut ipek on 18.09.2023.
//

import Foundation
import Firebase
import FirebaseStorage

struct ImageUploader {
    static func uploadImage(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
    }
}
