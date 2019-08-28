//
//  DogListService.swift
//  desafios-iddog
//
//  Created by Carlos Alberto Mota Candreva on 27/08/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import Foundation
import Alamofire
import Reachability


/// Beer service
protocol DogServiceProtocol {

    /// Gets beer list
    ///
    /// - Parameters:
    ///   - token: User Token For Api
    ///   - category: Category of Dogs That Will Load
    ///   - perPage: Items per page (max = 80)
    ///   - completion: Completion block
    func getDogsList(token: String, completion: @escaping ((() throws -> (BeerList)) -> Void))
}


class DogsService: DogServiceProtocol {

    private let reachability: ChallengeReachability

    init(reachability: ChallengeReachability = Reachability(hostName: ApiRouter.Constants.baseURLPath)) {
        self.reachability = reachability
    }

    func getDogsList(token: String, completion: @escaping ((() throws -> (BeerList)) -> Void)) {
        guard reachability.internetIsReachable else {
            completion { throw BrewDogError.offlineMode }
            return
        }

        Alamofire.request(ApiRouter.feed(token))
            .validate(statusCode: 200..<300)
            .responseDecodable { (response: DataResponse) in
            switch response.result {
            case .success(let board):
                do {
                    let dogs = try JSONDecoder().decode([Beer].self, from: data)

                    let beerList = BeerList(beers: beers)

                    completion { beerList }
                } catch {
                    completion { throw Errors.parse(String(describing: [Beer].self)) }
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion { throw error }
            }
        }

//        session.loadData(from: url) { data, _, error in
//            if let error = error {
//                print(error.localizedDescription)
//                completion { throw error }
//            } else if let data = data {
//                do {
//                    let beers = try JSONDecoder().decode([Beer].self, from: data)
//
//                    let beerList = BeerList(beers: beers)
//
//                    completion { beerList }
//                } catch {
//                    completion { throw BrewDogError.parse(String(describing: [Beer].self)) }
//                }
//            }
//        }
    }
}
