//
//  LoginViewModel.swift
//  desafios-iddog
//
//  Created by Carlos Alberto Mota Candreva on 24/08/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import Foundation
import Alamofire
import UIKit


/// Delegate to comunicate with controller
protocol LoginViewModelDelegate: class {

    /// Called when some error happen
    ///
    /// - Parameters:
    ///   - viewModel: DogListViewModel
    ///   - error: Error
    func returnTokenAndGoToDogSelector(_ token: String)
}


class LoginViewModel {
    weak var delegate: LoginViewModelDelegate?
    private var email: String = ""
    private var service: SingUpServiceProtocol
    private var error = false

    init(singUpService: SingUpServiceProtocol = SingUpService()) {
        self.service = singUpService
    }
}

// MARK: - Auxiliar methods
extension LoginViewModel {

    /// Fetches dog list
    ///
    /// - Parameter refresh: True if screen is being refreshed
    func getToken() {
        error = false
        service.getToken(email: email) { [weak self] (callback) in
            guard let weakSelf = self else { return }
            do {

                let token = try callback()

                if !token.isEmpty {
                    weakSelf.delegate?.returnTokenAndGoToDogSelector(token)
                }
            } catch {
                weakSelf.error = true
            }
        }
    }

    func setEmail(email: String) {
        self.email = email
        self.getToken()
    }
}
