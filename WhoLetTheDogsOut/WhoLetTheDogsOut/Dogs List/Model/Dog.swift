//
//  Dog.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 26/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Foundation

struct Dog: Decodable {
    let category: String
    let list: [String]
}
