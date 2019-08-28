//
//  UIImageView+Extensions.swift
//  desafios-iddog
//
//  Created by Carlos Alberto Mota Candreva on 27/08/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {

    /// Set default placeholder
    func setImagePlaceHolder() {
        let placeholder = UIImage(named: "image-placeholder")
        image = placeholder
        contentMode = .center
    }


    /// Downloads images using kingfisher
    /// 
    /// - Parameter stringURL: URL
    func setImage(with stringURL: String) {
        setImagePlaceHolder()

        let url = URL(string: stringURL)

        kf.setImage(with: url,
                    placeholder: image) { [weak self] result in
                        if case .success = result {
                            guard let weakSelf = self else { return }
                            weakSelf.contentMode = .scaleAspectFit
                        }
        }
    }
}

