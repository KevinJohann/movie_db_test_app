//
//  SplashDelegateSpy.swift
//  MovieApp_Tests
//
//  Created by Kevin Torres on 19-01-21.
//

@testable import movieApp

// MARK: - SplashDelegateSpy
class SplashDelegateSpy: SplashDelegate {
    // MARK: - onFeedRequested
    var onFeedRequestedWasCalled = false
    func onFeedRequested() { onFeedRequestedWasCalled = true }
}
