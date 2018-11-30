//
//  DogsCollectionViewController+List.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 26/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import UIKit

extension DogsCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : DogCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.setImageUrlString(viewModel.dogUrlString(for: indexPath))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? DogCollectionViewCell {
            let viewController = BigPhotoViewController()
            viewController.setDogImage(cell.dogImageView?.image ?? UIImage())
            viewController.setNavigationTitle(viewModel.dogsList[indexPath.section].category)
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin = 10
        
        let width = (UIScreen.main.bounds.width - CGFloat(2*margin))/4
        
        let size = CGSize(width: width,
                          height: (width*1.41) + 30)
        
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader, let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: DogSectionHeaderView.self), for: indexPath) as? DogSectionHeaderView {
            header.headerTitle?.text = viewModel.allBreeds[indexPath.section].capitalized
            header.frame = CGRect(x: header.frame.minX, y: header.frame.minY, width: view.frame.width, height: 150)
            return header
        }
        
        return UICollectionReusableView()
    }
    
}
