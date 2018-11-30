//
//  DogsListService.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 29/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Promises

class DogsListService {
    
    let apiClient: APIClient
    
    init(apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
    }
    
    func getDog(for breed: String) -> Promise<Dog> {
        return apiClient.request(model: Dog.self, DogsListRouter.feed(breed))
    }
}

