//
//  SplashWireframe.swift
//  movieApp
//
//  Created by Kevin Torres on 15-01-21.
//  
//

import UIKit

// MARK: - SplashDelegate
protocol SplashDelegate: AnyObject {
    func onFeedRequested()
}

// MARK: - SplashWireframe
enum SplashWireframe {
    static func createModule(with delegate: SplashDelegate) -> UIViewController {
        let view = SplashViewController.storyboardViewController()
        let presenter = SplashPresenter()
        let interactor = SplashInteractor()

        view.presenter = presenter
        
        interactor.interactorOutput = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.delegate = delegate
                
        return view
    }
}
