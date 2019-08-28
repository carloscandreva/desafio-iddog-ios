//
//  Token.swift
//  desafios-iddog
//
//  Created by Carlos Alberto Mota Candreva on 26/08/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import Foundation

// MARK: - User
struct User: Codable {
    let user: UserClass
}

// MARK: - UserClass
struct UserClass: Codable {
    let id, email, token, createdAt: String
    let updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case email, token, createdAt, updatedAt
        case v = "__v"
    }
}
