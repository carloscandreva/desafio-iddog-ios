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

    func dogsGallery(token: String) {
        let vc = GalleryViewController.instantiate()
        vc.coordinator = self
        vc.token = token
        navigationController.pushViewController(vc, animated: true)
    }
}
