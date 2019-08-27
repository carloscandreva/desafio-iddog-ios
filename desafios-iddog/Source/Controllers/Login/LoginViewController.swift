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
    @IBOutlet weak var loginTextField: UITextField!

    weak var coordinator: MainCoordinator?

    @IBAction func didTapLogin() {
        viewModel?.doLogin(email: loginTextField.text ?? "")
    }

    var viewModel: LoginViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = LoginViewModelable()
        if let coordinator = coordinator {
            self.viewModel?.coordinator = coordinator
        }
        // Do any additional setup after loading the view.
    }
}
