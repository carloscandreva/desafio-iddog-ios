//
//  BeerService.swift
//  genericAppForInterview
//
//  Created by Carlos Alberto Mota Candreva on 28/11/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import Foundation
import Reachability


/// Beer service
protocol BeerServiceProtocol {

    /// Gets beer list
    ///
    /// - Parameters:
    ///   - page: Page number (starting in 1)
    ///   - perPage: Items per page (max = 80)
    ///   - completion: Completion block
    func getBeerList(page: Int, perPage: Int, completion: @escaping ((() throws -> (BeerList)) -> Void))
}

class BeerService: BeerServiceProtocol {

    private let session: ChallengeURLSession
    private let reachability: ChallengeReachability

    init(session: ChallengeURLSession = URLSession.shared, reachability: ChallengeReachability = Reachability(hostName: ApiRouter.Constants.baseURLPath)) {
        self.session = session
        self.reachability = reachability
    }

    func getBeerList(page: Int, perPage: Int, completion: @escaping ((() throws -> (BeerList)) -> Void)) {
        guard reachability.internetIsReachable else {
            completion { throw Errors.offlineMode }
            return
        }

        guard let url = beerListUrl(page: page, perPage: perPage) else {
            completion { throw Errors.generic }
            return
        }

        session.loadData(from: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
                completion { throw error }
            } else if let data = data {
                do {
                    let beers = try JSONDecoder().decode([Beer].self, from: data)

                    let beerList = BeerList(beers: beers)

                    completion { beerList }
                } catch {
                    completion { throw Errors.parse(String(describing: [Beer].self)) }
                }
            }
        }
    }
}

// MARK: - Private methods
private extension BeerService {
    func beerListUrl(page: Int, perPage: Int) -> URL? {
        var urlComponents = URLComponents(string: ApiRouter.Constants.baseURLPath)
        urlComponents?.queryItems = [URLQueryItem(name: ApiRouter.Constants.queryPage, value: "\(page)"),
                                     URLQueryItem(name: ApiRouter.Constants.queryPerPage, value: "\(perPage)")]

        return urlComponents?.url
    }
}
