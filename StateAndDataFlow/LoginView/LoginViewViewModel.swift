//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import Foundation
import Combine

final class LoginViewViewModel: ObservableObject {
    
    @Published private var storageManager = StorageManager.shared

    @Published var inputName = ""
    @Published var isLoggedIn = false
    
    var nameSymbolCount: Bool {
        inputName.count <= 3 ? false : true
    }
    
    func login() {
        if !inputName.isEmpty {
            var user = User(name: inputName, isLoggedIn: isLoggedIn)
            storageManager.save(user: user)
            isLoggedIn.toggle()
            user.isLoggedIn = isLoggedIn
        }
    }
    
    func logout() {
        isLoggedIn.toggle()
        storageManager.deleteUser(at: storageManager.fetchUsers().count - 1)
        inputName = ""
    }
}
