//
//  NavigationBarVisibilityTogglable.swift
//  movieApp
//
//  Created by Kevin Torres on 16-01-21.
//

import Foundation
import UIKit

// MARK: - NavigationBarVisibilityTogglable
protocol NavigationBarVisibilityTogglable: AnyObject {
    func showNavigationBar(animated: Bool)
    func hideNavigationBar(animated: Bool)
}

// MARK: - Default implementation
extension NavigationBarVisibilityTogglable where Self: UIViewController {
    func showNavigationBar(animated: Bool = true) {
        guard let nc = navigationController, nc.isNavigationBarHidden else { return }
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    func hideNavigationBar(animated: Bool = true) {
        guard let nc = navigationController, !nc.isNavigationBarHidden else { return }
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
