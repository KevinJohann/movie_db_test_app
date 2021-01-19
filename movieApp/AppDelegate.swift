//
//  AppDelegate.swift
//  movieApp
//
//  Created by Kevin Torres on 15-01-21.
//

import UIKit

@main
final class AppDelegate: UIResponder {
    var appCoordinator: Coordinator?
    var window: UIWindow?
}

// MARK: - UIApplicationDelegate
extension AppDelegate: UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        setInitialVC()

        return true
    }
}

// MARK: - Private methods
extension AppDelegate {
    // MARK: - setInitialVC
    private func setInitialVC() {
        window = UIWindow(frame: UIScreen.main.bounds)

        let nc = LightContentNavigationController()

        appCoordinator = AppCoordinator(navigationController: nc)
        appCoordinator?.start()

        window?.rootViewController = nc
        window?.makeKeyAndVisible()
    }
}
