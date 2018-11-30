//
//  Dog.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 26/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Foundation

struct Dog: Codable {
    let category: String
    let list: [URL]
    
    var path: String {
        return "storedDog\(category).json"
    }
}
