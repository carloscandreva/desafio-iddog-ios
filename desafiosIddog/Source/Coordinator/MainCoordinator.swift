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
        let vc = LaucherViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }

    func beerList() {
        let vc = BeerListCollectionViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }

    func beerDetail(beerViewModel: BeerViewModel) {
            let vc = BeerDetailViewController.instantiate()
            vc.setup(beerViewModel)
            navigationController.pushViewController(vc, animated: true)
    }
}
