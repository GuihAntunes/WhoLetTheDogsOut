//
//  KeychainAccess.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 26/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Foundation

class KeychainAccess {
    
    func saveToken(_ token: String) throws {
        guard let tag = "com.guihsoft.keys.token".data(using: .utf8) else { return }
        let addquery: [String: Any] = [kSecClass as String: kSecClassKey,
                                       kSecAttrApplicationTag as String: tag,
                                       kSecValueRef as String: token]
        let status = SecItemAdd(addquery as CFDictionary, nil)
        guard status == errSecSuccess else { throw CustomError.generalError("Failed to save token on keychain") }
    }
    
    func getToken() throws -> String {
        guard let tag = "com.guihsoft.keys.token".data(using: .utf8) else { throw CustomError.generalError("Failed to generate tag!") }
        let getquery: [String: Any] = [kSecClass as String: kSecClassKey,
                                       kSecAttrApplicationTag as String: tag,
                                       kSecAttrKeyType as String: kSecAttrKeyTypeRSA,
                                       kSecReturnRef as String: true]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(getquery as CFDictionary, &item)
        guard status == errSecSuccess else { throw CustomError.generalError("Failed to retrive token from keychain") }
        guard let key = item as? String else { throw CustomError.generalError("Failed to retrive token from keychain") }
        return key
    }
    
    var isLoggedIn: Bool {
        do {
            let _ = try getToken()
            return true
        } catch {
            return false
        }
    }
    
}
