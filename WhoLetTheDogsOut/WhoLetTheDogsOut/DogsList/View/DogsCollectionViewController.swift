//
//  DogsCollectionViewController.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 26/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import UIKit

class DogsCollectionViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var dogsCollectionView: UICollectionView?
    
    // MARK: - Properties
    lazy var viewModel = DogsListViewModel(view: self)
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        viewModel.loadDogsList()
    }
    
    // MARK: - General Methods
    func configureCollectionView() {
        dogsCollectionView?.dataSource = self
        dogsCollectionView?.delegate = self
    }
    
    // MARK: - Actions

}
