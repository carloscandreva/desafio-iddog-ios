//
//  ChallengeURLSession.swift
//  genericAppForInterview
//
//  Created by Carlos Alberto Mota Candreva on 28/11/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import Foundation

protocol ChallengeURLSession {

    /// Load data from url
    ///
    /// - Parameters:
    ///   - url: url
    ///   - completionHandler: Completion handler
    func loadData(from url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
}

