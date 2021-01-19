//
//  SplashPresenterProtocolSpy.swift
//  MovieApp_Tests
//
//  Created by Kevin Torres on 19-01-21.
//

@testable import movieApp

// MARK: - SplashPresenterProtocolSpy
class SplashPresenterProtocolSpy: SplashPresenterProtocol {
    // MARK: - onViewDidLoad
    var onViewDidAppearWasCalled = false
    func onViewDidAppear() { onViewDidAppearWasCalled = true }

    // MARK: - onViewWillAppear
    var onViewWillAppearWasCalled = false
    func onViewWillAppear() { onViewWillAppearWasCalled = true }
}
