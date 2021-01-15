//
//  SplashPresenter.swift
//  movieApp
//
//  Created by Kevin Torres on 15-01-21.
//  
//

// MARK: - SplashPresenter
final class SplashPresenter {
    weak var view: SplashViewProtocol?
    var interactor: SplashInteractorProtocol?
    weak var delegate: SplashDelegate?
}

// MARK: - SplashPresenterProtocol
extension SplashPresenter: SplashPresenterProtocol {}

// MARK: - SplashInteractorOutputProtocol
extension SplashPresenter: SplashInteractorOutputProtocol {}
