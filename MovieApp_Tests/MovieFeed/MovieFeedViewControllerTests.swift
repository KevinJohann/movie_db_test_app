//
//  MovieFeedViewControllerTests.swift
//  MovieFeedViewControllerTests
//
//  Created by Kevin Torres on 18-01-21.
//

import XCTest
@testable import movieApp

class MovieFeedViewControllerTests: XCTestCase {
    var sut: MovieFeedViewController!
    var presenterSpy: MovieFeedPresenterProtocolSpy!

    override func setUp() {
        sut = MovieFeedViewController.storyboardViewController()
        presenterSpy = MovieFeedPresenterProtocolSpy()

        sut.presenter = presenterSpy
    }

    override func tearDown() {
        sut = nil
        presenterSpy = nil
    }
}

extension MovieFeedViewControllerTests {
    func testViewDidLoad() {
        sut.viewDidLoad()

        XCTAssertTrue(presenterSpy.onViewDidLoadWasCalled)
    }

    func testViewWillAppear() {
        sut.viewWillAppear(true)

        XCTAssertTrue(presenterSpy.onViewWillAppearWasCalled)
    }

    func testGetNumberOfItems() {}
    func testCellForItemAt() {}

    func testShowMovieDetail() {
        let dummyId = String()

        sut.onShowInfo(using: dummyId)

        XCTAssertTrue(presenterSpy.onShowMovieDetailWasCalled)
    }
}
