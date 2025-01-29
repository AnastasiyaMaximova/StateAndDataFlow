//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Anastasya Maximova on 28.01.2025.
//

import Foundation
import SwiftUI

final class StorageManager {
    static let shared = StorageManager()
    
    private init() {}
    
    @AppStorage("user") private var userData = Data()
    
    func fetchUsers() -> [User] {
        guard let users = try? JSONDecoder().decode([User].self, from: userData) else { return [] }
        return users
    }
        
    func save(user: User) {
        var users = fetchUsers()
        users.append(user)
        saveUsersToUserDefaults(users)
    }
    
    func deleteUser(at index: Int) {
        var users = fetchUsers()
        users.remove(at: index)
        saveUsersToUserDefaults(users)
    }
    
    private func saveUsersToUserDefaults(_ users: [User]) {
        guard let encodedUser = try? JSONEncoder().encode(users) else { return }
        userData = encodedUser
    }
}


