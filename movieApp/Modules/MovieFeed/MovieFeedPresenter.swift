//
//  MovieFeedPresenter.swift
//  movieApp
//
//  Created by Kevin Torres on 15-01-21.
//  
//

import Foundation

// MARK: - MovieFeedPresenter
final class MovieFeedPresenter {
    weak var view: MovieFeedViewProtocol?
    var interactor: MovieFeedInteractorProtocol?
    weak var delegate: MovieFeedDelegate?

    private var mediaDataSource: [MediaItemCellDataSource]? {
        didSet {
            view?.reloadData()
            view?.stopSkeleton()
        }
    }
}

// MARK: - MovieFeedPresenterProtocol
extension MovieFeedPresenter: MovieFeedPresenterProtocol {
    func onViewDidLoad() {
        view?.startSkeleton()
        interactor?.getUpcomingDataSource()
        view?.setupNavigationBar()
    }

    func onViewWillAppear() {
        view?.showNavigationBar(animated: true)
    }

    func getNumberOfItems() -> Int {
        mediaDataSource?.count ?? .zero
    }

    func onCellForItemAt(index: Int) -> MediaItemCellDataSource? {
        mediaDataSource?[index]
    }

    func onShowMovieDetail(using id: String) {
        delegate?.onMediaItemSelected(id: id)
    }
}

// MARK: - MovieFeedInteractorOutputProtocol
extension MovieFeedPresenter: MovieFeedInteractorOutputProtocol {
    func onGetUpcomingCollectionResponse() {}

    func onGetUpcomingCollectionSuccess(response: [MediaItemCellDataSource]) {
        mediaDataSource = response
    }

    func onGetUpcomingCollectionFailure() {}
}

// MARK: - Entity
struct MediaDataSource: MediaItemCellDataSource {
    var id: String
    var title: String
    var posterPath: URL?
    var overview: String
    var voteAverage: Float
}
