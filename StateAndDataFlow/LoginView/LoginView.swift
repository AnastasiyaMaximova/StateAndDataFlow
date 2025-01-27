//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $loginViewVM.name)
                    .multilineTextAlignment(.center)
                Text(loginViewVM.name.count.description)
                    .padding(.trailing, 16)
                    .foregroundStyle(loginViewVM.nameSymbolCount ? .blue : .red)
                
            }
            Button(action: login) {
                Label("OK", systemImage: "checkmark.circle")
                    .foregroundStyle(loginViewVM.nameSymbolCount ? .blue : .red)
            }
            .disabled(!loginViewVM.nameSymbolCount)
        }
    }
    
    private func login() {
        if !loginViewVM.name.isEmpty {
            loginViewVM.isLoggedIn.toggle()
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewViewModel())
}
