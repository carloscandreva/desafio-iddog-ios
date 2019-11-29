//
//  URLSession+Extensions.swift
//  desafiosIddog
//
//  Created by Carlos Alberto Mota Candreva on 28/11/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import Foundation

// MARK: - BrewDogURLSession
extension URLSession: ChallengeURLSession {

    /// Data task to load
    ///
    /// - Parameters:
    ///   - url: url
    ///   - completionHandler: completionHandler
    func loadData(from url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        dataTask(with: url) { (data, urlResponse, error) in
            completionHandler(data, urlResponse, error)
            }.resume()
    }
}
