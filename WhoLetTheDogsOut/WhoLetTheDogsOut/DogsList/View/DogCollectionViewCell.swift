//
//  DogCollectionViewCell.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 26/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import UIKit
import AlamofireImage
import Reachability

class DogCollectionViewCell: UICollectionViewCell, Identifiable {
    
    // MARK: - Outlets
    @IBOutlet weak var dogImageView: UIImageView?
    
    // MARK: - Properties
    private var imageUrlString = "" {
        didSet {
            downloadImage()
        }
    }
    
    let imageCache = AutoPurgingImageCache()

    // MARK: - Methods
    func setImageUrlString(_ string: String) {
        imageUrlString = string
    }
    
    func downloadImage() {
        guard Reachability()?.isConnected ?? false else {
            dogImageView?.image = imageCache.image(withIdentifier: imageUrlString)
            return
        }
        
        if let url = URL(string: imageUrlString) {
            dogImageView?.af_setImage(withURL: url, progressQueue: .global(), imageTransition: .noTransition, runImageTransitionIfCached: false, completion: { (image) in
                self.imageCache.add(image.value ?? UIImage(), withIdentifier: self.imageUrlString)
                self.dogImageView?.contentMode = .scaleAspectFill
            })
        }
    }
    
    override func prepareForReuse() {
        dogImageView?.image = UIImage()
    }
    
}
