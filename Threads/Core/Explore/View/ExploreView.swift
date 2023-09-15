//
//  ExploreView.swift
//  Threads
//
//  Created by aykut ipek on 12.09.2023.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText: String = ""
    @StateObject private var vm: ExploreViewModel
    
    init() {
        _vm = StateObject(wrappedValue: ExploreViewModel())
    }
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(vm.users) { user in
                        NavigationLink(value: user) {
                            VStack {
                                UserCell(user: user)
                                Divider()
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView()
            })
            .searchable(text: $searchText, prompt: "Search")
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
