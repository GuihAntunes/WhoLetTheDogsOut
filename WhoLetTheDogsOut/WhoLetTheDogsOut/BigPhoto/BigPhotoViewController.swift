//
//  BigPhotoViewController.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 30/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import UIKit

class BigPhotoViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var dogImageView: UIImageView?
    
    // MARK: - Properties
    private var dogImage: UIImage?
    private var dogCategory: String?
    
    // MARK: - View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fillController()
    }
    
    // MARK: - General Methods
    func setDogImage(_ image: UIImage) {
        dogImage = image
    }
    
    func setNavigationTitle(_ title: String) {
        dogCategory = title
    }
    
    private func fillController() {
        dogImageView?.image = dogImage
        title = dogCategory?.capitalized
    }
    
    // MARK: - Actions

}
