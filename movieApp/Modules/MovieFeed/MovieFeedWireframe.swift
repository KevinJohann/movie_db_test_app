//
//  MovieFeedWireframe.swift
//  movieApp
//
//  Created by Kevin Torres on 15-01-21.
//  
//

import UIKit

// MARK: - MovieFeedDelegate
protocol MovieFeedDelegate: AnyObject {
    func onMediaItemSelected(id: String)
}

// MARK: - MovieFeedWireframe
enum MovieFeedWireframe {
    static func createModule(with delegate: MovieFeedDelegate) -> UIViewController {
        let mediaRemoteManager = MediaRemoteManager()

        let view = MovieFeedViewController.storyboardViewController()
        let presenter = MovieFeedPresenter()
        let interactor = MovieFeedInteractor(mediaRemoteManager: mediaRemoteManager)

        mediaRemoteManager.getCollectionsOutputProtocol = interactor
        
        view.presenter = presenter
        
        interactor.interactorOutput = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.delegate = delegate
                
        return view
    }
}
