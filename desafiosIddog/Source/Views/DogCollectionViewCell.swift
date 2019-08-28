//
//  DogCollectionViewCell.swift
//  desafios-iddog
//
//  Created by Carlos Alberto Mota Candreva on 27/08/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import UIKit

class DogCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var bannerImage: UIImageView!

    private(set) var dogViewModel: DogViewModel!

    override func awakeFromNib() {
        super .awakeFromNib()

        layer.cornerRadius = 4
        layer.masksToBounds = false
        clipsToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowRadius = 1
        layer.shadowOpacity = 0.2
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        bannerImage.kf.cancelDownloadTask()
    }
}

// MARK: - Auxiliar methods
extension DogCollectionViewCell {
    func setup(dog: DogViewModel) {
        dogViewModel = dog
        bannerImage.setImage(with: dog.imageURL)
    }
}

// MARK: - Identifiable
extension DogCollectionViewCell: Identifiable {}
