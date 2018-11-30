//
//  DogsListRepository.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 26/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Promises
import Reachability

protocol DogsListDataAccess: class {
    func getDog(for breed: String) -> Promise<Dog>
}


class DogsListRepository: DogsListDataAccess {
    
    let service: DogsListService
    let dataManager: StorageDataManager
    
    init(service: DogsListService = DogsListService(), dataManager: StorageDataManager = StorageDataManager()) {
        self.service = service
        self.dataManager = dataManager
    }
    
    func getDog(for breed: String) -> Promise<Dog> {
        return Promise<Dog> { [weak self] fulfill, reject in
            guard Reachability()?.isConnected ?? false else {
                if let dog = self?.dataManager.getStoredDog(breed) {
                    fulfill(dog)
                } else {
                    reject(CustomError.generalError("No dog stored!"))
                }
                return
            }
            self?.service.getDog(for: breed).then({ [weak self] (dog) in
                self?.dataManager.saveDog(dog)
                fulfill(dog)
            }).catch({ (error) in
                if let dog = self?.dataManager.getStoredDog(breed) {
                    fulfill(dog)
                } else {
                    reject(error)
                }
            })
        }
    }
    
}
