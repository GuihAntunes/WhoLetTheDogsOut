//
//  SignInViewController+View.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 28/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Foundation

protocol SignInViewControllerPresentable: class {
    func startLoading()
    func stopLoading()
    func presentHomeScreen()
    func presentAlertWith(message: String)
}

extension SignInViewController: SignInViewControllerPresentable {
    func startLoading() {
        print("loader started")
    }
    
    func stopLoading() {
        print("loader stopped")
    }
    
    func presentHomeScreen() {
        print("presented")
    }
    
    func presentAlertWith(message: String) {
        print("alerted")
    }
}
