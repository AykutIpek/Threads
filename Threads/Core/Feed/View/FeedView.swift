//
//  FeedView.swift
//  Threads
//
//  Created by aykut ipek on 12.09.2023.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel: FeedViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: FeedViewModel())
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.threads) { thread in
                        ThreadCell(thread: thread)
                    }
                }
            }
            .refreshable {
                Task {
                    try await viewModel.fetchThreads()
                }
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    toolbarTrailingItem
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            FeedView()
        }
    }
}

private extension FeedView {
    var toolbarTrailingItem: some View {
        Button {
            
        } label: {
            Image(systemName: "arrow.counterclockwise")
                .foregroundColor(Color.primary)
        }
    }
}
