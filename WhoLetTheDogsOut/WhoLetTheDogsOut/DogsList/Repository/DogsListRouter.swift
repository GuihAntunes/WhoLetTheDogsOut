//
//  DogsListRouter.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 26/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Alamofire

enum DogsListRouter: CustomRouter {
    
    case feed()
    
    /**
     * Path according to route */
    var path: String {
        switch self {
        case .feed:
            return URLS.feed
        }
    }
    
    /**
     * HTTP method according to route */
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    // MARK: - URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        return try baseURLRequest()
    }
    
}
