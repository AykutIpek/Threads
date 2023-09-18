//
//  UserCell.swift
//  Threads
//
//  Created by aykut ipek on 13.09.2023.
//

import SwiftUI

struct UserCell: View {
    let user: User
    var body: some View {
        HStack {
            CircularProfileImageView()
            VStack(alignment: .leading, spacing: 2.0) {
                Text(user.username)
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text(user.fullname)
                    .font(.footnote)
            }
            .font(.footnote)
            
            Spacer()
            
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
        }
        .padding(.horizontal)
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(user: dev.user)
    }
}
