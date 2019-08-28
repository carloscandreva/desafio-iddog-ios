//
//  LoginViewController.swift
//  desafios-iddog
//
//  Created by Carlos Alberto Mota Candreva on 24/08/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController, Storyboarded {
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var invalidEmailLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!

    weak var coordinator: MainCoordinator?
    private var loginViewModel = LoginViewModel()


    @IBAction func didTapLogin() {
        if let email = loginTextField.text, isValidEmail(emailStr: email) {
            invalidEmailLabel.isHidden = true
            loginViewModel.setEmail(email: email)
        } else {
            invalidEmailLabel.isHidden = false
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        loginViewModel.delegate = self
    }

    func isValidEmail(emailStr:String) -> Bool {

        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
    }
}


// MARK: - LoginViewModelDelegate
extension LoginViewController: LoginViewModelDelegate {
    func returnTokenAndGoToDogSelector(_ token: String) {
        self.coordinator?.dogsSelector(token: token)
    }
}
