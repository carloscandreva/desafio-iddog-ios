//
//  GalleryViewController.swift
//  desafios-iddog
//
//  Created by Carlos Alberto Mota Candreva on 25/08/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import Foundation
import UIKit

struct GridCoordinates: Equatable {
    let x: Int
    let y: Int
}

class GalleryViewController: UIViewController, Storyboarded {
    let layout = UICollectionViewLayout()
//    var viewModel: LoginViewModel
    weak var coordinator: MainCoordinator?
    var token: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}
