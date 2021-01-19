//
//  MovieFeedInteractor.swift
//  movieApp
//
//  Created by Kevin Torres on 15-01-21.
//  
//

import Foundation

// MARK: - MovieFeedInteractor
final class MovieFeedInteractor {
    weak var interactorOutput: MovieFeedInteractorOutputProtocol?
    let mediaRemoteManager: MediaRemoteManagerProtocol

    required init(mediaRemoteManager: MediaRemoteManagerProtocol) {
        self.mediaRemoteManager = mediaRemoteManager
    }

    private var mediaDataSource = [MediaItemCellDataSource]()
}

// MARK: - MovieFeedInteractorProtocol
extension MovieFeedInteractor: MovieFeedInteractorProtocol {
    func getUpcomingDataSource() {
        let parameters = CollectionContentParameters()
        mediaRemoteManager.getUpcomingCollection(parameters: parameters)
    }
}

// MARK: - GetCollectionsOutputProtocol
extension MovieFeedInteractor: GetCollectionsOutputProtocol {
    func onGetUpcomingCollectionResponse() {}

    func onGetUpcomingCollectionSuccess(response: UpComingMoviesResponse) {
        let results = response.results

        results.forEach {
            let urlImage = APIEnvironment.baseURLImage + $0.posterPath
            let url = URL(string: urlImage)

            let id = String($0.id)

            let mediaDS = MediaDataSource(id: id,
                                          title: $0.title,
                                          posterPath: url,
                                          overview: $0.overview,
                                          voteAverage: $0.voteAverage)

            mediaDataSource.append(mediaDS)
        }

        interactorOutput?.onGetUpcomingCollectionSuccess(response: mediaDataSource)
    }

    func onGetUpcomingCollectionFailure() {
        interactorOutput?.onGetUpcomingCollectionFailure()
    }
}
