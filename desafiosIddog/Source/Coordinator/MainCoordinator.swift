//
//  MainCoordinator.swift
//  desafios-iddog
//
//  Created by Carlos Alberto Mota Candreva on 26/08/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = LoginViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }

    func dogsGallery(token: String, category: String) {
        let vc = DogGalleryViewController.instantiate()
        vc.coordinator = self
        vc.token = token
        vc.category = category
        navigationController.pushViewController(vc, animated: true)
    }

    func dogsSelector(token: String) {
        let vc = DogsSelectorViewController.instantiate()
        vc.coordinator = self
        vc.token = token
        navigationController.pushViewController(vc, animated: true)
    }

    func dogDetail(dogViewModel: DogViewModel) {
        let vc = DogDetailViewController.instantiate()
//        vc.coordinator = self
//        vc.token = token
        vc.setup(dogViewModel)
        navigationController.pushViewController(vc, animated: true)
    }
}
