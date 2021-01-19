//
//  SplashPresenterTests.swift
//  MovieApp_Tests
//
//  Created by Kevin Torres on 19-01-21.
//

import XCTest
@testable import movieApp

class SplashPresenterTests: XCTestCase {
    var sut: SplashPresenter!

    var viewSpy: SplashViewProtocolSpy!
    var interactorSpy: SplashInteractorProtocolSpy!
    var delegateSpy: SplashDelegateSpy!

    override func setUp() {
        sut = SplashPresenter()
        viewSpy = SplashViewProtocolSpy()
        interactorSpy = SplashInteractorProtocolSpy()
        delegateSpy = SplashDelegateSpy()

        sut.view = viewSpy
        sut.interactor = interactorSpy
        sut.delegate = delegateSpy
    }

    override func tearDown() {
        sut = nil
        viewSpy = nil
        interactorSpy = nil
        delegateSpy = nil
    }
}

// MARK: - Presenter
extension SplashPresenterTests {
    func testOnViewDidAppear() {
        sut.onViewDidAppear()

        XCTAssertTrue(delegateSpy.onFeedRequestedWasCalled)
    }

    func testOnViewWillAppear() {
        sut.onViewWillAppear()

        XCTAssertTrue(viewSpy.hideNavigationBarWasCalled)
    }
}
