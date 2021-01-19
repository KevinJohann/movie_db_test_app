//
//  AppCoordinator.swift
//  movieApp
//
//  Created by Kevin Torres on 15-01-21.
//

import UIKit

// MARK: - AppCoordinatorProtocol
protocol AppCoordinatorProtocol: Coordinator {}

// MARK: - AppCoordinator
final class AppCoordinator {
    let navigationController: UINavigationController
    private var homeCoordinator: HomeCoordinator?

    required init(navigationController: UINavigationController) {
        navigationController.modalPresentationStyle = .fullScreen

        self.navigationController = navigationController
    }
}

// MARK: - AppCoordinatorProtocol
extension AppCoordinator: AppCoordinatorProtocol {
    func start() {
        let vc = SplashWireframe.createModule(with: self)
        navigationController.pushViewController(vc, animated: true)
    }
}

// MARK: - SplashDelegate
extension AppCoordinator: SplashDelegate {
    func onFeedRequested() {
        let nc = UINavigationController()

        homeCoordinator = HomeCoordinator(navigationController: nc)
        homeCoordinator?.start()

        navigationController.present(nc, animated: true)
    }
}
