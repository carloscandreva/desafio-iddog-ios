//
//  BeerLoadingCollectionViewCell.swift
//  genericAppForInterview
//
//  Created by Carlos Alberto Mota Candreva on 28/11/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import UIKit

class BeerLoadingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
}

// MARK: - Auxiliar methods
extension BeerLoadingCollectionViewCell {
    func setup() {
        activityIndicatorView.startAnimating()
        activityIndicatorView.color = .silver
    }
}

// MARK: - Identifiable
extension BeerLoadingCollectionViewCell: Identifiable {}
