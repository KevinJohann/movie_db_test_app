//
//  SplashViewController.swift
//  movieApp
//
//  Created by Kevin Torres on 15-01-21.
//  
//

import UIKit

// MARK: - SplashViewController
final class SplashViewController: UIViewController {
    var presenter: SplashPresenterProtocol?
}

// MARK: - Life cycles
extension SplashViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

// MARK: - SplashViewProtocol
extension SplashViewController: SplashViewProtocol {}
