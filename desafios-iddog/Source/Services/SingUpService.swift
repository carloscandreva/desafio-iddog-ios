//
//  SingUpService.swift
//  desafios-iddog
//
//  Created by Carlos Alberto Mota Candreva on 27/08/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import Foundation
import Alamofire
import Reachability


/// Beer service
protocol SingUpServiceProtocol {

    /// Gets beer list
    ///
    /// - Parameters:
    ///   - email: User Email For Api
    ///   - completion: Completion block
    func getToken(email: String, completion: @escaping ((() throws -> (String)) -> Void))
}


class SingUpService: SingUpServiceProtocol {

    private let reachability: ChallengeReachability

    init(reachability: ChallengeReachability = Reachability(hostName: ApiRouter.Constants.baseURLPath)) {
        self.reachability = reachability
    }

    func getToken(email: String, completion: @escaping ((() throws -> (String)) -> Void)) {
        guard reachability.internetIsReachable else {
            completion { throw Errors.offlineMode }
            return
        }

        Alamofire.request(ApiRouter.signUp(email))
            .validate(statusCode: 200..<300)
            .responseJSON { (response: DataResponse) in
                switch response.result {
                case .success( _):
                    do {
                        guard let d = response.data else { return }
                        let decoder = JSONDecoder()
                        let model = try decoder.decode(User.self, from: d)
                        completion { model.user.token }
                    } catch {
                        completion { throw Errors.parse(String(describing: User.self)) }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    completion { throw error }
                }
        }

    }
}
