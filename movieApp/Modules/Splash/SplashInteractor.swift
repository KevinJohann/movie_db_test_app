//
//  SplashInteractor.swift
//  movieApp
//
//  Created by Kevin Torres on 15-01-21.
//  
//

// MARK: - SplashInteractor
final class SplashInteractor {
    weak var interactorOutput: SplashInteractorOutputProtocol?
    required init() {}
}

// MARK: - SplashInteractorProtocol
extension SplashInteractor: SplashInteractorProtocol {}
