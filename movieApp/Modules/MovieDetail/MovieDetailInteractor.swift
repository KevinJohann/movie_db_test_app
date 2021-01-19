//
//  MovieDetailInteractor.swift
//  movieApp
//
//  Created by Kevin Torres on 17-01-21.
//  
//

import Foundation

// MARK: - MovieDetailInteractor
final class MovieDetailInteractor {
    weak var interactorOutput: MovieDetailInteractorOutputProtocol?
    let mediaRemoteManager: MediaRemoteManagerProtocol

    required init(mediaRemoteManager: MediaRemoteManagerProtocol) {
        self.mediaRemoteManager = mediaRemoteManager
    }
}

// MARK: - MovieDetailInteractorProtocol
extension MovieDetailInteractor: MovieDetailInteractorProtocol {
    func onGetMovieDetail(using id: String) {
        let parameters = CollectionContentParameters()
        mediaRemoteManager.getMovieDetail(using: id, parameters: parameters)
    }
}

// MARK: - GetMovieDetailOutputProtocol
extension MovieDetailInteractor: GetMovieDetailOutputProtocol {
    func onGetMovieDetailResponse() {

    }

    func onGetMovieDetailSuccess(response: DetailMoviesResponse) {

        let stringURLPosterPath = APIEnvironment.baseURLImage + response.posterPath
        let stringURLbackdropPath = APIEnvironment.baseURLImage + response.backdropPath
        let urlPosterPath = URL(string: stringURLPosterPath)
        let urlBackdropPath = URL(string: stringURLbackdropPath)
        let voteAverageAsString = String(response.voteAverage)
        let popularityAsString = String(response.popularity)
        let voteCount = String(response.voteCount)

        let movieDetailDS = MovieDetailDataSource(title: response.title,
                                                  posterPath: urlPosterPath,
                                                  backdropPath: urlBackdropPath,
                                                  overview: response.overview,
                                                  voteAverage: voteAverageAsString,
                                                  popularity: popularityAsString,
                                                  voteCount: voteCount,
                                                  homepage: response.homepage)

        interactorOutput?.onGetMovieDetailSuccess(response: movieDetailDS)
    }

    func onGetMovieDetailFailure() {
        interactorOutput?.onGetMovieDetailFailure()
    }
}
