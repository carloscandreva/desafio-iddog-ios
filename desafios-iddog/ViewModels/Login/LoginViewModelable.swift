//
//  LoginViewModelable.swift
//  desafios-iddog
//
//  Created by Carlos Alberto Mota Candreva on 24/08/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import Foundation
import Alamofire

class LoginViewModelable: NSObject, LoginViewModel {

    // MARK: LoginViewModelable protocol
    func doLogin(email: String) {
        Alamofire.request(ApiRouter.signUp(email)).responseJSON { token in
            // TODO: Get token and pass to feed screen
        }
    }
}
