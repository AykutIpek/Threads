//
//  CurrentUserProfileView.swift
//  Threads
//
//  Created by aykut ipek on 18.09.2023.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @StateObject private var vm: CurrentUserProfileViewModel
    
    init() {
        _vm = StateObject(wrappedValue: CurrentUserProfileViewModel())
    }
    
    private var currentUser: User? {
        return vm.currentUser
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ProfileHeaderView(user: currentUser)
                }
                
                editProfileButton
                
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
            .padding(.horizontal)
        }
    }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView()
    }
}

//MARK: - Buttons
private extension CurrentUserProfileView {
    var editProfileButton: some View {
        Button {
            
        } label: {
            Text("Edit profile")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .frame(width: 352, height: 32)
                .background(.white)
                .cornerRadius(8)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
        }
    }
}
