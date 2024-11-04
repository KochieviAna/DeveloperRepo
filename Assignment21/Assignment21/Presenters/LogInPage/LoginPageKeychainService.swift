//
//  QuizPageKeychainService.swift
//  Assignment21
//
//  Created by MacBook on 04.11.24.
//

import UIKit
import Security

final class LoginPageKeychainService {
    
    static let shared = LoginPageKeychainService()
    
    private init() { }
    
    func saveUserData(key: String, data: Data) -> OSStatus {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecValueData: data
        ] as CFDictionary
        
        SecItemDelete(query)
        
        return SecItemAdd(query, nil)
    }
    
    func fetchUserData(key: String) -> Data? {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecReturnData: true,
            kSecMatchLimit: kSecMatchLimitOne
        ] as CFDictionary
        
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query, &dataTypeRef)
        
        if status == errSecSuccess {
            return dataTypeRef as? Data
        } else {
            return nil
        }
    }
}

