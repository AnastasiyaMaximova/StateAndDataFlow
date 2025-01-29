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
        
                TextField("Enter your name", text: $loginViewVM.inputName)
                    .multilineTextAlignment(.center)
                Text(loginViewVM.inputName.count.description)
                    .foregroundStyle(loginViewVM.nameSymbolCount ? .blue : .red)
            }
            Button(action: loginViewVM.login) {
                Label("OK", systemImage: "checkmark.circle")
            }
            .disabled(!loginViewVM.nameSymbolCount)
            .opacity(loginViewVM.nameSymbolCount ? 1 : 0)
        }
        .padding()
    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewViewModel())
}
