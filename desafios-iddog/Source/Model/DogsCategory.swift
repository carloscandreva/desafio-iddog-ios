//
//  DogsCategory.swift
//  desafios-iddog
//
//  Created by Carlos Alberto Mota Candreva on 26/08/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import Foundation

// MARK: - DogsCategory
struct DogsCategory: Codable {
    let category: String
    let list: [String]
}

// MARK: - DogsCategoryClass
struct DogsCategoryClass: Codable {
    let category: String
    let list: [String]

    enum CodingKeys: String, CodingKey {
        case category = "category"
        case list = "list"
    }
}

