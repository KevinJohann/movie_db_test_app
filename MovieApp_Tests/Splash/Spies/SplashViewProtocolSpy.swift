//
//  SplashViewProtocolSpy.swift
//  MovieApp_Tests
//
//  Created by Kevin Torres on 19-01-21.
//

@testable import movieApp

// MARK: - SplashViewProtocolSpy
class SplashViewProtocolSpy: SplashViewProtocol {
    // MARK: - hideNavigationBar
    var hideNavigationBarWasCalled = false
    var animated: Bool?
    func hideNavigationBar(animated: Bool) {
        hideNavigationBarWasCalled = true
        self.animated = animated
    }

    // MARK: - showNavigationBar
    var showNavigationBarWasCalled = false
    func showNavigationBar(animated: Bool) {
        showNavigationBarWasCalled = true
        self.animated = animated
    }
}
