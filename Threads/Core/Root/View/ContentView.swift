//
//  ContentView.swift
//  Threads
//
//  Created by aykut ipek on 12.09.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm: ContentViewModel
    
    init() {
        _vm = StateObject(wrappedValue: ContentViewModel())
    }
    
    var body: some View {
        Group {
            if vm.userSession != nil {
                ThreadsTabView()
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
