//
//  MovieDetailWireframe.swift
//  movieApp
//
//  Created by Kevin Torres on 17-01-21.
//  
//

import UIKit

// MARK: - MovieDetailDelegate
protocol MovieDetailDelegate: BaseModuleDelegate {}

// MARK: - MovieDetailWireframe
enum MovieDetailWireframe {
    static func createModule(with delegate: MovieDetailDelegate, movieId: String) -> UIViewController {
        let mediaRemoteManager = MediaRemoteManager()

        let view = MovieDetailViewController.storyboardViewController()
        let presenter = MovieDetailPresenter(id: movieId)
        let interactor = MovieDetailInteractor(mediaRemoteManager: mediaRemoteManager)

        view.presenter = presenter
        
        interactor.interactorOutput = presenter

        mediaRemoteManager.getMovieDetailOutputProtocol = interactor
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.delegate = delegate
                
        return view
    }
}
