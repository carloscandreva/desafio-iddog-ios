//
//  Errors.swift
//  desafios-iddog
//
//  Created by Carlos Alberto Mota Candreva on 27/08/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import Foundation


/// Possible errors
///
/// - httpError: Http response error
/// - generic: Unknown error
/// - parse: parse error
/// - offlineMode: user is offline
enum Errors: Error {
    case httpError(Int)
    case generic
    case parse(String)
    case offlineMode
}
