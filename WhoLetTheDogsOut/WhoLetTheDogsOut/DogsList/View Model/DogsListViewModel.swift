//
//  DogsListViewModel.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 26/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Foundation

class DogsListViewModel {
    
    // MARK: - Properties
    var view: DogsCollectionViewControllerPresentable?
    var dogsList: [Dog] = []
    
    // MARK: - Initializer
    init(view: DogsCollectionViewControllerPresentable? = nil) {
        self.view = view
    }
    
    // MARK: - Data Fillers
    var numberOfSections: Int {
        return 4
    }
    
    func numberOfItemsInSection(_ section: Int) -> Int {
        return dogsList[section].list.count
    }
    
    func dogUrlString(for indexPath: IndexPath) -> String {
        return dogsList[indexPath.section].list[indexPath.item]
    }
}
