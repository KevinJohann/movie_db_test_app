//
//  Extensions.swift
//  movieApp
//
//  Created by Kevin Torres on 18-01-21.
//

import UIKit

// MARK: - UIVIew Extension
extension UIView {
    func setAsRoundedView() {
        DispatchQueue.main.async {
            self.layer.cornerRadius = self.frame.height / 2
            self.clipsToBounds = true
        }
    }
}
