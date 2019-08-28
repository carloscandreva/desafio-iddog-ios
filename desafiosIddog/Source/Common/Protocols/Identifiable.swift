//
//  Identifiable.swift
//  desafios-iddog
//
//  Created by Carlos Alberto Mota Candreva on 27/08/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import UIKit


protocol Identifiable: class {
}

// MARK: - Identifiable Extension on UIView
extension Identifiable where Self: UIView {

    /// Reuse identifier used in storyboards
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
