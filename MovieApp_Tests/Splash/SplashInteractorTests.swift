//
//  SplashInteractorTests.swift
//  MovieApp_Tests
//
//  Created by Kevin Torres on 19-01-21.
//

import XCTest
@testable import movieApp

class SplashInteractorTests: XCTestCase {
    var sut: SplashInteractor!

    var interactorOutputSpy: SplashInteractorOutputProtocolSpy!

    override func setUp() {
        interactorOutputSpy = SplashInteractorOutputProtocolSpy()
        sut = SplashInteractor()

        sut.interactorOutput = interactorOutputSpy
    }

    override func tearDown() {
        sut = nil
        interactorOutputSpy = nil
    }
}

// MARK: - Interactor
extension SplashInteractorTests {}
