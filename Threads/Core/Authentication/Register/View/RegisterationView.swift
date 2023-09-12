//
//  RegisterationView.swift
//  Threads
//
//  Created by aykut ipek on 12.09.2023.
//

import SwiftUI

struct RegisterationView: View {
    @StateObject private var vm: RegisterationViewModel
    
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
                
                Spacer()
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
}
