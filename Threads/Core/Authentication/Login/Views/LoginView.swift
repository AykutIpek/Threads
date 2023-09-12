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
                // App Icon
                logo
                // Text Field
                form
                // Forgot Password Button
                forgotPassword
                // Authentication generic button
                AuthButton(buttonText: "Login") {
                    
                }
                Spacer()
                
                Divider()
                // Go to register page
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
    var logo: some View {
        Image("threadsIcon")
            .resizable()
            .frame(width: 150, height: 150)
            .scaledToFill()
            .padding()
    }
    var form: some View {
        Group {
            email
            password
        }
        .font(.subheadline)
        .padding(12)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal, 24)
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
            
        } label: {
            HStack(spacing: 3.0) {
                Text("Don't have an account")
                Text("Sign Up")
                    .fontWeight(.semibold)
            }
            .foregroundColor(.black)
            .font(.footnote)
        }
        .padding(.vertical, 16)
    }
}
