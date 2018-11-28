//
//  APIClient.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 26/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Alamofire
import Reachability
import Promises

enum CustomError: Error {
    case connectionError(String)
    case mappingError(String)
    case APIError(String)
    case generalError(String)
    case deallocatedClass(String)
}

class APIClient {
    
    let connectionChecker: Reachability?
    let decoder : JSONDecoder
    
    init(connectionChecker : Reachability? = Reachability(), decoder: JSONDecoder = JSONDecoder()) {
        self.connectionChecker = connectionChecker
        self.decoder = decoder
    }
    
    func request<T: Decodable>(model: T.Type, _ request: URLRequestConvertible) -> Promise<T> {
        return Promise<T> { [weak self] fulfill, reject in
            guard let _self = self else {
                print("Class deinitialized!")
                return
            }
            
            guard let checker = _self.connectionChecker, checker.isConnected else {
                reject(CustomError.connectionError("Por favor, verifique sua conexão com a internet!"))
                return
            }
            
            Alamofire.request(request).validate().responseData(completionHandler: { (response) in
                guard let data = response.value else {
                    reject(CustomError.APIError(response.error?.localizedDescription ?? "Ocorreu um erro inesperado, por favor, tente novamente!"))
                    return
                }
                
                guard let model = try? _self.decoder.decode(T.self, from: data) else {
                    reject(CustomError.mappingError("Houve um erro ao fazer o parse do modelo \(T.self)!"))
                    return
                }
                
                fulfill(model)
            })
        }
    }
    
}
