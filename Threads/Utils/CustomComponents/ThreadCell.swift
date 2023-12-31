//
//  ThreadCell.swift
//  Threads
//
//  Created by aykut ipek on 12.09.2023.
//

import SwiftUI

struct ThreadCell: View {
    let thread: Thread
    
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                CircularProfileImageView(user: thread.user, size: .small)
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        
                        userNameText
                        
                        Spacer()
                        
                        timeText
                        
                        optionsButton
                    }
                    
                    bodyText
                    
                    cellButtonsGroup
                }
            }
            Divider()
        }
        .padding()
    }
}

struct ThreadCell_Previews: PreviewProvider {
    static var previews: some View {
        ThreadCell(thread: dev.thread)
    }
}

private extension ThreadCell {
    
    var userNameText: some View {
        Text(thread.user?.username ?? "-")
            .font(.footnote)
            .fontWeight(.semibold)
    }
    
    var timeText: some View {
        Text(thread.timestamp.timestampString())
            .font(.caption)
            .foregroundColor(Color(.systemGray3))
    }
    
    var bodyText: some View {
        Text(thread.caption)
            .font(.footnote)
            .multilineTextAlignment(.leading)
    }
}

//MARK: - Buttons and Buttons Group
private extension ThreadCell {
    var cellButtonsGroup: some View {
        HStack(spacing: 16) {
            likeButton
            commentsButton
            rethreadButton
            sendButton
        }
        .foregroundColor(Color.primary)
        .padding(.vertical, 8)
    }
    
    var likeButton: some View {
        Button {
            
        } label: {
            Image(systemName: "heart")
        }
    }
    
    var commentsButton: some View {
        Button {
            
        } label: {
            Image(systemName: "bubble.right")
        }
    }
    
    var rethreadButton: some View {
        Button {
            
        } label: {
            Image(systemName: "arrow.rectanglepath")
        }
    }
    
    var sendButton: some View {
        Button {
            
        } label: {
            Image(systemName: "paperplane")
        }
    }
    
    var optionsButton: some View {
        Button {
            
        } label: {
            Image(systemName: "ellipsis")
                .foregroundColor(Color(.darkGray))
        }
    }
}
