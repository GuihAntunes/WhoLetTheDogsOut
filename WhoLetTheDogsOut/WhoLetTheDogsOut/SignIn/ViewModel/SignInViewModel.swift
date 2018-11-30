//
//  SignInViewModel.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 27/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Alamofire

class SignInViewModel {
    
    let repository: SignInDataAccess?
    let view: SignInViewControllerPresentable?
    
    init(repository: SignInDataAccess = SignInRepository(), view: SignInViewControllerPresentable) {
        self.repository = repository
        self.view = view
    }
    
    func checkSession() -> Bool {
        return repository?.alreadyLogged() ?? false
    }
    
    func signInUserWith(email: String) {
        view?.startLoading()
        repository?.signInWith(email: email).then(handleResponse).catch(handleError).always(handleAlways)
    }
    
    private func handleResponse(_ logged: Bool) {
        guard logged else {
            view?.presentAlertWith(message: "")
            return
        }
        
        view?.presentHomeScreen()
    }
    
    private func handleError(_ error: Error) {
        view?.presentAlertWith(message: "")
    }
    
    private func handleAlways() {
        view?.stopLoading()
    }
}
