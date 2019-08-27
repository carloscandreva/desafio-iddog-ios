//
//  LoginViewModelable.swift
//  desafios-iddog
//
//  Created by Carlos Alberto Mota Candreva on 24/08/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class LoginViewModelable: NSObject, LoginViewModel {
    var coordinator: MainCoordinator?
    // MARK: LoginViewModelable protocol
    func doLogin(email: String) {
        Alamofire.request(ApiRouter.signUp(email)).responseJSON { response in
            do {
                guard let data = response.data else { return }
                let decoder = JSONDecoder()
                let model = try decoder.decode(User.self, from: data)
                print(model.user.token)
                self.coordinator?.dogsGallery(token: model.user.token)
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
    }
}
