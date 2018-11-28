//
//  SignInRepository.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 28/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Promises

protocol SignInDataAccess: class {
    func signInWith(email: String) -> Promise<Bool>
}

class SignInRepository: SignInDataAccess {
    
    let remoteRepository: SignInService
    let localRepository: KeychainAccess
    
    init(remoteRepository: SignInService = SignInService(), localRepository: KeychainAccess = KeychainAccess()) {
        self.remoteRepository = remoteRepository
        self.localRepository = localRepository
    }
    
    func signInWith(email: String) -> Promise<Bool> {
        return Promise<Bool> { fulfill, reject in
            if self.localRepository.isLoggedIn {
                fulfill(true)
            } else {
                self.remoteRepository.signInWith(email: email).then { response in
                    self.handleSignInResponse(response)
                    fulfill(true)
                }.catch({ (error) in
                    reject(error)
                })
            }
        }
    }
    
    private func handleSignInResponse(_ response: SignInResponse) {
        do {
           try localRepository.saveToken(response.user?.token ?? "")
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
