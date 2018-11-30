//
//  DogCollectionViewCell.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 26/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import UIKit
import SDWebImage
import Reachability

class DogCollectionViewCell: UICollectionViewCell, Identifiable {
    
    // MARK: - Outlets
    @IBOutlet weak var dogImageView: UIImageView?
    
    // MARK: - Properties
    private var imageUrl : URL? {
        didSet {
            downloadImage()
        }
    }
    
    // MARK: - Methods
    func setImageUrlString(_ string: URL) {
        imageUrl = string
    }
    
    func downloadImage() {
        guard let image = SDImageCache.shared().imageFromDiskCache(forKey: imageUrl?.absoluteString) else {
            dogImageView?.sd_setImage(with: imageUrl)
            return
        }
        dogImageView?.image = image
        
    }
    
    override func prepareForReuse() {
        dogImageView?.image = UIImage()
    }
    
}
