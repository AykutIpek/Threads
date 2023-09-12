//
//  TextFieldModifier.swift
//  Threads
//
//  Created by aykut ipek on 12.09.2023.
//

import Foundation
import SwiftUI


struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textInputAutocapitalization(.none)
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
