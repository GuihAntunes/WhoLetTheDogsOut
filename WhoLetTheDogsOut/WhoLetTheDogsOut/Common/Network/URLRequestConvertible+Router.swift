//
//  URLRequestConvertible+Router.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 26/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Alamofire

protocol CustomRouter: URLRequestConvertible {
    var path: String { get }
    var method: HTTPMethod { get }
    func baseURLRequest() throws -> URLRequest
}

extension CustomRouter {
    func baseURLRequest() throws -> URLRequest {
        let url = try URLS.BaseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields?.updateValue("application/json", forKey: "Content-Type")
        
        return urlRequest
    }
}
