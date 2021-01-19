//
//  HomeCoordinator.swift
//  movieApp
//
//  Created by Kevin Torres on 16-01-21.
//

import UIKit

// MARK: - HomeCoordinatorProtocol
protocol HomeCoordinatorProtocol: Coordinator {}

// MARK: - HomeCoordinator
final class HomeCoordinator {
    let navigationController: UINavigationController

    required init(navigationController: UINavigationController) {
        navigationController.modalPresentationStyle = .fullScreen

        self.navigationController = navigationController
    }
}

// MARK: - HomeCoordinatorProtocol
extension HomeCoordinator: HomeCoordinatorProtocol {
    func start() {
        let vc = MovieFeedWireframe.createModule(with: self)
        navigationController.pushViewController(vc, animated: true)
    }
}

// MARK: - MovieFeedDelegate
extension HomeCoordinator: MovieFeedDelegate {
    func onDismissRequested() { navigationController.dismiss(animated: true) }
    func onMediaItemSelected(id: String) {
        let vc = MovieDetailWireframe.createModule(with: self, movieId: id)
        navigationController.present(vc, animated: true)
    }
}

// MARK: - MovieDetailDelegate
extension HomeCoordinator: MovieDetailDelegate {}
