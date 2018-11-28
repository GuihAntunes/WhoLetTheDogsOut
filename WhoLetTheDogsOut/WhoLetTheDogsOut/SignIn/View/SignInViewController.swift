//
//  SignInViewController.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 27/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var confirmButton: UIButton?
    @IBOutlet weak var emailTextField: UITextField?
    
    // MARK: - Properties
    lazy var viewModel = SignInViewModel(view: self)
    var userEmail: String {
        get {
            return emailTextField?.text ?? ""
        }
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextField()
        configureButton()
    }
    
    // MARK: - General Methods
    func configureTextField() {
        emailTextField?.attributedPlaceholder = NSAttributedString( string: "E-mail", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    func configureButton() {
        confirmButton?.layer.cornerRadius = 20
        confirmButton?.clipsToBounds = true
        confirmButton?.addTarget(self, action: #selector(logIn), for: .touchUpInside)
    }
    
    @objc func logIn() {
        viewModel.signInUserWith(email: userEmail)
    }
    
    // MARK: - Actions

}
