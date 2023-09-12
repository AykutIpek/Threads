//
//  RegisterationView.swift
//  Threads
//
//  Created by aykut ipek on 12.09.2023.
//

import SwiftUI

struct RegisterationView: View {
    //MARK: - Properties
    @StateObject private var vm: RegisterationViewModel
    @Environment(\.dismiss) var dismiss
    
    init() {
        _vm = StateObject(wrappedValue: RegisterationViewModel())
    }
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                // App Icon brought from general view extension
                appIcon
                // Form fields brought from login view extension
                formGeneral
                
                AuthButton(buttonText: "Sign Up") {
                    
                }
                .padding()
                
                
                Spacer()
                
                Divider()
                
                goLoginButton
            }
        }
    }
}

struct RegisterationView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterationView()
    }
}

private extension RegisterationView {
    var formGeneral: some View {
        Group {
            email
            username
            fullname
            password
        }
        .modifier(TextFieldModifier())
    }
    var email: some View {
        TextField("Enter your email", text: $vm.model.email)
    }
    var username: some View {
        TextField("Enter your username", text: $vm.model.username)
    }
    var fullname: some View {
        TextField("Enter your fullname", text: $vm.model.fullName)
    }
    var password: some View {
        SecureField("Enter your password", text: $vm.model.password)
    }
    
    var goLoginButton: some View {
        Button {
            dismiss()
        } label: {
            HStack(spacing: 3.0) {
                Text("Already for an account")
                Text("Sign In")
                    .fontWeight(.semibold)
            }
            .foregroundColor(Color.primary)
            .font(.footnote)
        }
        .padding(.vertical, 16)
    }
}
