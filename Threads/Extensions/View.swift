//
//  View.swift
//  Threads
//
//  Created by aykut ipek on 12.09.2023.
//

import SwiftUI


extension View {
    var appIcon: some View {
        Image("threadsIcon")
            .resizable()
            .frame(width: 150, height: 150)
            .scaledToFill()
            .padding()
    }
}
