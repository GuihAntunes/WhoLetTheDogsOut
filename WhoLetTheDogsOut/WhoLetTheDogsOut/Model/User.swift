//
//  User.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 27/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Foundation

struct User: Decodable {
    let id: String?
    let email: String?
    let token: String?
    let createdAt: String?
    let updatedAt: String?
    let v: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case email
        case token
        case createdAt
        case updatedAt
        case v = "__v"
    }
}
