//
//  UserDataManager.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 28/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Foundation

class UserDataManager {
    
    let userDefault: UserDefaults
    
    init(with userDefault: UserDefaults = UserDefaults.standard) {
        self.userDefault = userDefault
    }
    
    func save(value:String, for key: String) {
        userDefault.set(value, forKey: key)
    }
    
    func getValueString(for key: String = "Token") -> String? {
        return userDefault.string(forKey: key)
    }
    
    var isLoggedIn: Bool {
        return getValueString(for: "Token")?.isEmpty ?? false
    }
    
}
