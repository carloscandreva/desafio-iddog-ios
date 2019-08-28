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


/// Dog service
protocol DogServiceProtocol {

    /// Gets dog list
    ///
    /// - Parameters:
    ///   - token: User Token For Api
    ///   - category: Category of Dogs That Will Load
    ///   - completion: Completion block
    func getDogsList(token: String, category: String, completion: @escaping ((() throws -> ([DogViewModel])) -> Void))
}


class DogsService: DogServiceProtocol {

    private let reachability: ChallengeReachability

    init(reachability: ChallengeReachability = Reachability(hostName: ApiRouter.Constants.baseURLPath)) {
        self.reachability = reachability
    }

    func getDogsList(token: String, category: String, completion: @escaping ((() throws -> ([DogViewModel])) -> Void)) {
        guard reachability.internetIsReachable else {
            completion { throw Errors.offlineMode }
            return
        }

        Alamofire.request(ApiRouter.feed(token, category))
            .validate(statusCode: 200..<300)
            .responseJSON { (response: DataResponse) in
            switch response.result {
            case .success( _):
                do {
                    guard let d = response.data else { return }
                    let decoder = JSONDecoder()
                    let dogsCategory = try decoder.decode(DogsCategory.self, from: d)
                    var dogs: [DogViewModel] = []
                    dogsCategory.list.forEach { url in
                        let dog = DogViewModel(imageURL: url)
                        dogs.append(dog)
                    }
                    completion { dogs }
                } catch {
                    completion { throw Errors.parse(String(describing: DogsCategory.self)) }
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion { throw error }
            }
        }

    }
}
