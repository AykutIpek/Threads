//
//  LoginView.swift
//  Threads
//
//  Created by aykut ipek on 12.09.2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var vm: LoginViewModel
    
    init() {
        _vm = StateObject(wrappedValue: LoginViewModel())
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                // App Icon brought from general view extension
                appIcon
                // Form fields brought from login view extension
                form
                // Forgot Password Button brought Login View Extension
                forgotPassword
                // Authentication generic button brought custom components
                AuthButton(buttonText: "Login") {
                    Task {
                        try await vm.login()
                    }
                }
                
                Spacer()
                
                Divider()
                // Go to register page brought login view extension
                createAccountButton
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

private extension LoginView {
    var form: some View {
        Group {
            email
            password
        }
        .modifier(TextFieldModifier())
        .textInputAutocapitalization(.none)
    }
    var email: some View {
        TextField("Enter your email", text: $vm.model.email)
    }
    var password: some View {
        SecureField("Enter your password", text: $vm.model.password)
    }
    var forgotPassword: some View {
        NavigationLink {
            //
        } label: {
            Text("Forgot Password?")
                .font(.footnote)
                .fontWeight(.semibold)
                .padding(.vertical)
                .padding(.trailing, 28)
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
    var createAccountButton: some View {
        NavigationLink {
            RegisterationView()
                .navigationBarBackButtonHidden()
        } label: {
            HStack(spacing: 3.0) {
                Text("Don't have an account")
                Text("Sign Up")
                    .fontWeight(.semibold)
            }
            .foregroundColor(Color.primary)
            .font(.footnote)
        }
        .padding(.vertical, 16)
    }
}
