//
//  DogsListRepository.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 26/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Foundation

protocol DogsListDataAccess: class {
    
}


class DogsListRepository: DogsListDataAccess {
    
    let client: APIClient
    
    init(apiClient: APIClient = APIClient()) {
        self.client = apiClient
    }
    
    func getDogPhotos() {
        
    }
    
}
