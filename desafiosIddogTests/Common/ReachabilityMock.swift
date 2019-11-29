//
//  ReachabilityMock.swift
//  genericAppForInterviewTests
//
//  Created by Carlos Alberto Mota Candreva on 28/08/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

@testable import genericAppForInterview

class ReachabilityMock: ChallengeReachability {
    private var reachable: Bool

    init(reachable: Bool = true) {
        self.reachable = reachable
    }

    var internetIsReachable: Bool {
        return reachable
    }
}
