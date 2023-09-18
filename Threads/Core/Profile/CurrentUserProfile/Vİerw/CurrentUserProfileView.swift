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
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
    private var currentUser: User? {
        return vm.currentUser
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 12) {
                            
                            headerTexts
                            
                            captionText
                            
                            followerTexts
                        }
                        
                        Spacer()
                        
                        CircularProfileImageView()
                    }
                }
                
                followButton
                
                //MARK: - User content List view
                VStack {
                    HStack {
                        ForEach(ProfileThreadFilter.allCases) { filter in
                            VStack {
                                Text(filter.title)
                                    .font(.subheadline)
                                    .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                
                                if selectedFilter == filter {
                                    Rectangle()
                                        .foregroundColor(.primary)
                                        .frame(width: filterBarWidth, height: 1)
                                        .matchedGeometryEffect(id: "item", in: animation)
                                } else {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: filterBarWidth, height: 1)
                                }
                            }
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selectedFilter = filter
                                }
                            }
                        }
                    }
                    LazyVStack {
                        ForEach(0 ... 10, id: \.self) { thread in
                            ThreadCell()
                        }
                    }
                }
                .padding(.vertical, 8)
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

//MARK: - Texts
private extension CurrentUserProfileView {
    var headerTexts: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(currentUser?.fullname ?? "")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(currentUser?.username ?? "")
                .font(.subheadline)
        }
    }
    
    @ViewBuilder
    var captionText: some View {
        if let bio = currentUser?.bio {
            Text(bio)
                .font(.footnote)
        }
    }
    
    var followerTexts: some View {
        Text("2 Followers")
            .font(.caption)
            .foregroundColor(.gray)
    }
}
