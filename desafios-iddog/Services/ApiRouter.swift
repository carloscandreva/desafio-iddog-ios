//
//  ApiRouter.swift
//  desafios-iddog
//
//  Created by Carlos Alberto Mota Candreva on 24/08/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import Alamofire

public enum ApiRouter: URLRequestConvertible {
    // 1
    enum Constants {
        static let baseURLPath = "https://api-iddog.idwall.co"
        static let authenticationToken = "Basic xxx"
    }

    // 2
    case signUp(String)
    case feed(String)

    // 3
    var method: HTTPMethod {
        switch self {
        case .signUp:
            return .post
        case .feed:
            return .get
        }
    }

    // 4
    var path: String {
        switch self {
        case .signUp:
            return "/signup"
        case .feed:
            return "/feed"
        }
    }

    // 5
    var parameters: [String: Any] {
        switch self {
        case .signUp(let email):
            return ["content": email]
        default:
            return [:]
        }
    }

    // 6
    public func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseURLPath.asURL()

        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.setValue(Constants.authenticationToken, forHTTPHeaderField: "Authorization")
        request.timeoutInterval = TimeInterval(10 * 1000)

        return try URLEncoding.default.encode(request, with: parameters)
    }
}
