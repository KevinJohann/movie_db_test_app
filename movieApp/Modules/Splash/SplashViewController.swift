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

// MARK: - Lifecycle
extension SplashViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.onViewWillAppear()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.onViewDidAppear()
    }
}

// MARK: - SplashViewProtocol
extension SplashViewController: SplashViewProtocol {}
