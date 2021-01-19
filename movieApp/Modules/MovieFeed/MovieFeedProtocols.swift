//
//  MovieFeedProtocols.swift
//  movieApp
//
//  Created by Kevin Torres on 15-01-21.
//  
//

// MARK: - View
protocol MovieFeedViewProtocol: NavigationBarVisibilityTogglable {
    func reloadData()
    func setupNavigationBar()
    func startSkeleton()
    func stopSkeleton()
}

// MARK: - Interactor
protocol MovieFeedInteractorProtocol: AnyObject {
    func getUpcomingDataSource()
}

// MARK: - InteractorOutput
protocol MovieFeedInteractorOutputProtocol: AnyObject {
    func onGetUpcomingCollectionResponse()
    func onGetUpcomingCollectionSuccess(response: [MediaItemCellDataSource])
    func onGetUpcomingCollectionFailure()
}

// MARK: - Presenter
protocol MovieFeedPresenterProtocol: ViewLifecycable {
    func getNumberOfItems() -> Int
    func onCellForItemAt(index: Int) -> MediaItemCellDataSource?
    func onShowMovieDetail(using id: String)
}
