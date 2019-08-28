//
//  DogDetailViewController.swift
//  desafios-iddog
//
//  Created by Carlos Alberto Mota Candreva on 27/08/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import UIKit

class DogDetailViewController: UIViewController, Storyboarded {
    @IBOutlet weak var bannerImageView: UIImageView! {
        didSet {
            bannerImageView.setImage(with: dogViewModel.imageURL)
        }
    }

    private var dogViewModel: DogViewModel!

    override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(animated)
        bannerImageView.kf.cancelDownloadTask()
    }
}

// MARK: - Auxiliar methods
extension DogDetailViewController {
    func setup(_ viewModel: DogViewModel) {
        dogViewModel = viewModel
    }
}
