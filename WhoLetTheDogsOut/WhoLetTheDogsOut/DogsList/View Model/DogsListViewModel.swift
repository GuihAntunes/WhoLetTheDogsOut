//
//  DogsListViewModel.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 26/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Promises

class DogsListViewModel {
    
    // MARK: - Properties
    var view: DogsCollectionViewControllerPresentable?
    var repository: DogsListDataAccess?
    var dogsList: [Dog] = []
    var allBreeds = ["husky", "hound", "pug", "labrador"]
    
    // MARK: - Initializer
    init(view: DogsCollectionViewControllerPresentable? = nil, repository: DogsListDataAccess = DogsListRepository()) {
        self.view = view
        self.repository = repository
    }
    
    // MARK: - Data Fetchers
    func loadDogsList() {
        view?.startLoading()
        all(allBreeds.compactMap{ repository?.getDog(for: $0)}).then(handleResponse).catch(handleError)
    }
    
    func handleResponse(_ dogs: [Dog]) {
        dogsList = dogs
        view?.reload()
    }
    
    private func handleError(_ error: Error) {
        view?.presentAlertWith(message: (error as? CustomError)?.localizedDescription ?? "Por favor, entre em contato conosco!")
    }
    
    // MARK: - Data Fillers
    var numberOfSections: Int {
        return dogsList.count
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return dogsList[section].list.count
    }
    
    func dogUrlString(for indexPath: IndexPath) -> URL {
        return dogsList[indexPath.section].list[indexPath.item]
    }
}
