//
//  AppCoordinator.swift
//  movieApp
//
//  Created by Kevin Torres on 15-01-21.
//

import UIKit

// MARK: - AppCoordinatorProtocol
protocol AppCoordinatorProtocol: Coordinator {}

final class AppCoordinator {
    let navigationController: UINavigationController

    required init(navigationController: UINavigationController) {
//        if #available(iOS 13.0, *) { navigationController.isModalInPresentation = true }
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

extension AppCoordinator: SplashDelegate {
    func onFeedRequested() {
        
    }
}
