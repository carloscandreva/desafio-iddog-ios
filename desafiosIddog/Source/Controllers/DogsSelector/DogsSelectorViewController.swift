//
//  DogsSelectorViewController.swift
//  desafios-iddog
//
//  Created by Carlos Alberto Mota Candreva on 27/08/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import Foundation
import UIKit

class DogsSelectorViewController: UIViewController, Storyboarded {


    weak var coordinator: MainCoordinator?
    var token: String?

    @IBAction func didTapHound() {
        viewModel?.showDogByCategory(category: "hound")
    }

    @IBAction func didTapHusk() {
        viewModel?.showDogByCategory(category: "husky")
    }

    @IBAction func didTapPug() {
        viewModel?.showDogByCategory(category: "pug")
    }

    @IBAction func didTapLabrador() {
        viewModel?.showDogByCategory(category: "labrador")
    }

    var viewModel: DogsSelectorViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = DogsSelectorViewModelable()

        if let coordinator = coordinator {
            self.viewModel?.coordinator = coordinator
        }
        if let token = token {
            self.viewModel?.token = token
        }
    }
}
