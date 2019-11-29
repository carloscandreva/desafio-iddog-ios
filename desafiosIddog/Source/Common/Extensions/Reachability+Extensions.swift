//
//  Reachability+Extensions.swift
//  desafios-iddog
//
//  Created by Carlos Alberto Mota Candreva on 27/08/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import Reachability

// MARK: - ChallengeReachability
extension Reachability: ChallengeReachability {

    /// True if internet is reachable
    var internetIsReachable: Bool {
        return isReachable()
    }
}
