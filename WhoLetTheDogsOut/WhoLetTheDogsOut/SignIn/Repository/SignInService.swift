//
//  SignInService.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 28/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Promises

class SignInService {
    
    let apiClient: APIClient
    
    init(apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
    }
    
    func signInWith(email: String) -> Promise<SignInResponse> {
        return apiClient.request(model: SignInResponse.self, SignInRouter.signIn(email))
    }
    
}
