//
//  SignInRouter.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 27/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Alamofire

enum SignInRouter: CustomRouter {
    
    case signIn(_ email: String)
    
    /**
     * Path according to route */
    var path: String {
        switch self {
        case .signIn:
            return URLS.signIn
        }
    }
    
    /**
     * HTTP method according to route */
    var method: HTTPMethod {
        switch self {
        default:
            return .post
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        case .signIn(let email):
            return ["email": email]
        }
    }
    
    // MARK: - URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = try baseURLRequest()
        
        switch self {
        case .signIn:
            if let data = try? JSONSerialization.data(withJSONObject: parameters, options: []) {
                urlRequest.httpBody = data
            }
        }
        
        return urlRequest
    }
    
}
