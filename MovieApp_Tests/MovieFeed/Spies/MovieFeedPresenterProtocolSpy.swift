//
//  MovieFeedPresenterProtocolSpy.swift
//  MovieApp_Tests
//
//  Created by Kevin Torres on 18-01-21.
//

@testable import movieApp

// MARK: - MovieFeedPresenterProtocolSpy
class MovieFeedPresenterProtocolSpy: MovieFeedPresenterProtocol {
    // MARK: - onViewDidLoad
    var onViewDidLoadWasCalled = false
    func onViewDidLoad() { onViewDidLoadWasCalled = true }

    // MARK: - onViewWillAppear
    var onViewWillAppearWasCalled = false
    func onViewWillAppear() { onViewWillAppearWasCalled = true }

    // MARK: - getNumberOfItems
    var getNumberOfItemsWasCalled = false
    func getNumberOfItems() -> Int {
        getNumberOfItemsWasCalled = true
        return 5
    }

    // MARK: - onCellForItemAt
    var onTestCellForItemAtWasCalled = false
    var index: Int?
    func onCellForItemAt(index: Int) -> MediaItemCellDataSource? {
        onTestCellForItemAtWasCalled = true

        self.index = index
        return nil
    }

    // MARK: - onShowMovieDetail
    var onShowMovieDetailWasCalled = false
    var id: String?
    func onShowMovieDetail(using id: String) {
        onShowMovieDetailWasCalled = true
        self.id = id
    }
}
