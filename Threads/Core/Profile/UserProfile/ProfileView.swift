//
//  ProfileView.swift
//  Threads
//
//  Created by aykut ipek on 12.09.2023.
//

import SwiftUI

struct ProfileView: View {
    //MARK: - Properties
    let user: User

    
    //MARK: - Body
    var body: some View {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ProfileHeaderView(user: user)
                }
                
                followButton
                
                //MARK: - User content List view
                UserContentListView()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.primary)
                    }

                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .padding(.horizontal)
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: dev.user)
    }
}

//MARK: - Buttons
private extension ProfileView {
    var followButton: some View {
        Button {
            
        } label: {
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 352, height: 32)
                .background(.black)
                .cornerRadius(8)
        }
    }
}
