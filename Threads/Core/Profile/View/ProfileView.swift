//
//  ProfileView.swift
//  Threads
//
//  Created by aykut ipek on 12.09.2023.
//

import SwiftUI

struct ProfileView: View {
    //MARK: - Properties
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
    //MARK: - Body
    var body: some View {
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
        .padding(.horizontal)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
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

//MARK: - Texts
private extension ProfileView {
    var headerTexts: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Charles Lecrech")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Charles_lecrech")
                .font(.subheadline)
        }
    }
    
    var captionText: some View {
        Text("Formula 1 driver for Scuderia Ferrari")
            .font(.footnote)
    }
    
    var followerTexts: some View {
        Text("2 Followers")
            .font(.caption)
            .foregroundColor(.gray)
    }
}
