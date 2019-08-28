//
//  ChallengeReachability.swift
//  desafios-iddog
//
//  Created by Carlos Alberto Mota Candreva on 27/08/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import Foundation

protocol ChallengeReachability {

    /// True if internet is available
    var internetIsReachable: Bool { get }
}
