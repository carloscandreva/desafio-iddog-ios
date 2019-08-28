//
//  UIColor+Extensions.swift
//  desafios-iddog
//
//  Created by Carlos Alberto Mota Candreva on 27/08/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Collor palette
extension UIColor {
    static var metal: UIColor {
        return UIColor(displayP3Red: 43.0/255.0, green: 48.0/255.0, blue: 58.0/255.0, alpha: 1)
    }

    static var blackCoral: UIColor {
        return UIColor(displayP3Red: 79.0/255.0, green: 93.0/255.0, blue: 117.0/255.0, alpha: 1)
    }

    static var silver: UIColor {
        return UIColor(displayP3Red: 191.0/255.0, green: 192.0/255.0, blue: 192.0/255.0, alpha: 1)
    }

    static var lightRed: UIColor {
        return UIColor(displayP3Red: 239.0/255.0, green: 131.0/255.0, blue: 84.0/255.0, alpha: 1)
    }
}

