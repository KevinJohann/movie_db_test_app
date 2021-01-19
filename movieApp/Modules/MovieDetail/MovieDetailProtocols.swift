//
//  MovieDetailProtocols.swift
//  movieApp
//
//  Created by Kevin Torres on 17-01-21.
//  
//

// MARK: - View
protocol MovieDetailViewProtocol: AnyObject {
    func set(dataSource: MediaDetailDataSource)
}

// MARK: - Interactor
protocol MovieDetailInteractorProtocol: AnyObject {
    func onGetMovieDetail(using id: String)
}

// MARK: - InteractorOutput
protocol MovieDetailInteractorOutputProtocol: AnyObject {
    func onGetMovieDetailResponse()
    func onGetMovieDetailSuccess(response: MediaDetailDataSource)
    func onGetMovieDetailFailure()
}

// MARK: - Presenter
protocol MovieDetailPresenterProtocol: ViewLifecycable {
    func onCloseButtonPressed()
}
