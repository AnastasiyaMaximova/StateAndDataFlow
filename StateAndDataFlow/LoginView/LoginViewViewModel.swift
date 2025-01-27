//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import Foundation
import Combine

final class LoginViewViewModel: ObservableObject {
 
    @Published var name = ""
    @Published var isLoggedIn = false
    var nameSymbolCount: Bool {
        name.count <= 3 ? false : true
    }
}
