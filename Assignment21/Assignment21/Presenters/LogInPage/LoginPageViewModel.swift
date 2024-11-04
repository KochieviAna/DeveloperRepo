//
//  LoginPageViewModel.swift
//  Assignment21
//
//  Created by MacBook on 04.11.24.
//

import Foundation
import Security

final class LoginPageViewModel {
    
    func isPasswordValid(_ password: String) -> Bool {
        let passwordRegex = NSPredicate(
            format: "SELF MATCHES %@",
            "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[^A-Za-z\\d])[A-Za-z\\d[^A-Za-z\\d]]{8,}$"
        )
        return passwordRegex.evaluate(with: password)
    }
    
    func userExists(username: String) -> Bool {
        return LoginPageKeychainService.shared.fetchUserData(key: username) != nil
    }
    
    func fetchPassword(for username: String) -> String? {
        guard let passwordData = LoginPageKeychainService.shared.fetchUserData(key: username) else {
            return nil
        }
        return String(data: passwordData, encoding: .utf8)
    }
    
    func saveUser(username: String, password: String) -> Bool {
        let passwordData = Data(password.utf8)
        let status = LoginPageKeychainService.shared.saveUserData(key: username, data: passwordData)
        
        return status == errSecSuccess
    }
}
