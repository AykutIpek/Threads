//
//  Buttons.swift
//  Threads
//
//  Created by aykut ipek on 12.09.2023.
//

import SwiftUI

struct AuthButton: View {
    //MARK: - Properties
    @Environment(\.colorScheme) var colorScheme
    let buttonText: String
    let action: () -> Void
    
    //MARK: - LifeCycle
    var body: some View {
        Button {
            action()
        } label: {
            Text(buttonText)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 352, height: 44)
                .background(colorScheme == .dark ? Color.blue : Color.black)
                .cornerRadius(8)
        }
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        AuthButton(buttonText: "Login") {}
            .previewLayout(.sizeThatFits)
    }
}
