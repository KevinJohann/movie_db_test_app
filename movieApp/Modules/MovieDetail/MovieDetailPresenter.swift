//
//  MovieDetailPresenter.swift
//  movieApp
//
//  Created by Kevin Torres on 17-01-21.
//  
//

import Foundation

// MARK: - MovieDetailPresenter
final class MovieDetailPresenter {
    weak var view: MovieDetailViewProtocol?
    var interactor: MovieDetailInteractorProtocol?
    weak var delegate: MovieDetailDelegate?

    private var id: String?

    init(id: String) { self.id = id }
}

// MARK: - MovieDetailPresenterProtocol
extension MovieDetailPresenter: MovieDetailPresenterProtocol {
    func onViewDidLoad() {
        guard let id = id else { return }
        interactor?.onGetMovieDetail(using: id)
    }

    func onCloseButtonPressed() {
        delegate?.onDismissRequested()
    }
}

// MARK: - MovieDetailInteractorOutputProtocol
extension MovieDetailPresenter: MovieDetailInteractorOutputProtocol {
    func onGetMovieDetailResponse() {

    }

    func onGetMovieDetailSuccess(response: MediaDetailDataSource) {
        view?.set(dataSource: response)
    }

    func onGetMovieDetailFailure() {

    }
}

// MARK: - Entity
struct MovieDetailDataSource: MediaDetailDataSource {
    var title: String
    var posterPath: URL?
    var backdropPath: URL?
    var overview: String
    var voteAverage: String
    var popularity: String
    var voteCount: String
    var homepage: String?
}
