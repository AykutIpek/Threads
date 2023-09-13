//
//  CircularProfileImageView.swift
//  Threads
//
//  Created by aykut ipek on 13.09.2023.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image("Max-Verstappen")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView()
            .previewLayout(.sizeThatFits)
    }
}
