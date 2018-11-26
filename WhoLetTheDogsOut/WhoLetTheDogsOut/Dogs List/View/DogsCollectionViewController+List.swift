//
//  DogsCollectionViewController+List.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 26/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import UIKit

extension DogsCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : DogCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.setImageUrlString("")
        return cell
    }
    
}
