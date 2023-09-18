//
//  EditProfileView.swift
//  Threads
//
//  Created by aykut ipek on 13.09.2023.
//

import SwiftUI

struct EditProfileView: View {
    @State private var isPrivateProfile: Bool = false
    @State private var bio = ""
    @State private var link = ""
    @Environment(\.dismiss) var dismiss
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
                            Text("Esteban Ocon")
                        }
                        Spacer()
                        
                        CircularProfileImageView()
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
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Done") {
                    
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
