//
//  DogsListRepository.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 26/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Promises

protocol DogsListDataAccess: class {
    func getDog(for breed: String) -> Promise<Dog>
}


class DogsListRepository: DogsListDataAccess {
    
    let service: DogsListService
    
    init(service: DogsListService = DogsListService()) {
        self.service = service
    }
    
    func getDog(for breed: String) -> Promise<Dog> {
        return Promise<Dog> { fulfill, reject in
            self.service.getDog(for: breed).then({ (dog) in
                fulfill(dog)
            }).catch({ (error) in
                reject(error)
            })
        }
    }
    
}
