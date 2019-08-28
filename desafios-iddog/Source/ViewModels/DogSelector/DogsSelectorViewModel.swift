//
//  DogsSelectorViewModel.swift
//  desafios-iddog
//
//  Created by Carlos Alberto Mota Candreva on 27/08/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

protocol DogsSelectorViewModel {
    var coordinator: MainCoordinator? {get set}
    var token: String? {get set}
    func showDogByCategory(category: String);
}

class DogsSelectorViewModelable: NSObject, DogsSelectorViewModel {
    var token: String?
    var coordinator: MainCoordinator?
    
    func showDogByCategory(category: String) {
        guard let t = self.token else { return }
        self.coordinator?.dogsGallery(token: t, category: category)
    }
}
