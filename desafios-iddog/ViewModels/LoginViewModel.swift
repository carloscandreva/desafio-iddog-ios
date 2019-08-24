//
//  LoginViewModel.swift
//  desafios-iddog
//
//  Created by Carlos Alberto Mota Candreva on 24/08/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import Foundation

protocol LoginViewModel {
    var email: String { get }
    func login();
}
