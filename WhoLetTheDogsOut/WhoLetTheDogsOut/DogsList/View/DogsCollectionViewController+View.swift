//
//  DogsCollectionViewController+View.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 26/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import UIKit

protocol DogsCollectionViewControllerPresentable: class {
    func startLoading()
    func stopLoading()
    func presentAlertWith(message: String)
    func reload()
}

extension DogsCollectionViewController: DogsCollectionViewControllerPresentable {
    func startLoading() {
        print("loader started")
    }
    
    func stopLoading() {
        print("loader stopped")
    }
    
    func presentAlertWith(message: String) {
        print("alerted")
    }
    
    func reload() {
        DispatchQueue.main.async {
            self.dogsCollectionView?.reloadData()
        }
    }
}
