//
//  SplashViewControllerTests.swift
//  MovieApp_Tests
//
//  Created by Kevin Torres on 19-01-21.
//

import XCTest
@testable import movieApp

class SplashViewControllerTests: XCTestCase {
    var sut: SplashViewController!
    var presenterSpy: SplashPresenterProtocolSpy!

    override func setUp() {
        sut = SplashViewController.storyboardViewController()
        presenterSpy = SplashPresenterProtocolSpy()

        sut.presenter = presenterSpy
    }

    override func tearDown() {
        sut = nil
        presenterSpy = nil
    }
}

// MARK: - View
extension SplashViewControllerTests {
    func testOnViewDidAppear() {
        sut.viewDidAppear(true)

        XCTAssertTrue(presenterSpy.onViewDidAppearWasCalled)
    }

    func testOnViewWillAppear() {
        sut.viewWillAppear(true)

        XCTAssertTrue(presenterSpy.onViewWillAppearWasCalled)
    }
}
