//
//  DogViewModel.swift
//  desafios-iddog
//
//  Created by Carlos Alberto Mota Candreva on 27/08/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

struct DogViewModel {
    private(set) var imageURL: String = String()
}

extension DogViewModel {
    init(_ url: String) {
        imageURL = url
    }
}
