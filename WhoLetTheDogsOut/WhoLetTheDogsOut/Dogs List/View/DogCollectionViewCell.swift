//
//  DogCollectionViewCell.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 26/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import UIKit
import AlamofireImage

class DogCollectionViewCell: UICollectionViewCell, Identifiable {
    
    // MARK: - Outlets
    @IBOutlet weak var dogImageView: UIImageView?
    
    // MARK: - Properties
    private var imageUrlString = "" {
        didSet {
            downloadImage()
        }
    }
    
    // MARK: - Methods
    func setImageUrlString(_ string: String) {
        imageUrlString = string
    }
    
    func downloadImage() {
        if let url = URL(string: imageUrlString) {
            dogImageView?.af_setImage(withURL: url, progressQueue: .global(), imageTransition: UIImageView.ImageTransition.flipFromLeft(0.3), runImageTransitionIfCached: false)
        }
    }
    
}
