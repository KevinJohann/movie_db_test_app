//
//  SplashProtocols.swift
//  movieApp
//
//  Created by Kevin Torres on 15-01-21.
//  
//

import UIKit

// MARK: - View
protocol SplashViewProtocol: AnyObject {}

// MARK: - Interactor
protocol SplashInteractorProtocol: AnyObject {}

// MARK: - InteractorOutput
protocol SplashInteractorOutputProtocol: AnyObject {}

// MARK: - Presenter
protocol SplashPresenterProtocol: ViewLifecycable {}
