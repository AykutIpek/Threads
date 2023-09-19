//
//  EditProfileView.swift
//  Threads
//
//  Created by aykut ipek on 13.09.2023.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    var user: User?
    
    @State private var isPrivateProfile: Bool = false
    @State private var bio = ""
    @State private var link = ""
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel: EditProfileViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: EditProfileViewModel())
    }

    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.semibold)
                            Text(user?.fullname ?? "-")
                        }
                        Spacer()
                        
                        PhotosPicker(selection: $viewModel.selectedItem) {
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            } else {
                                CircularProfileImageView(user: user, size: .small)
                            }
                        }
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        TextField("Enter your bio...", text: $bio, axis: .vertical)
                    }
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("Link")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        TextField("Add link...", text: $link, axis: .vertical)
                    }
                    
                    Divider()
                    
                    HStack {
                        
                        Toggle("Private Profile", isOn: $isPrivateProfile)
                    }
                    
                }
                .font(.footnote)
                .padding()
                .background(.background)
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
                .padding()
            }
        }
        .navigationTitle("Edit Profile")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
                .font(.subheadline)
                .foregroundColor(.black)
            }
            
            ToolbarItem(placement: .primaryAction) {
                Button("Done") {
                    Task {
                        try await viewModel.updateUserData()
                        dismiss()
                    }
                }
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.black)
            }
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EditProfileView()
        }
    }
}
