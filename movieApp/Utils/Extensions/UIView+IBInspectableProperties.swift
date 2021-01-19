//
//  UIView+IBInspectableProperties.swift
//  movieApp
//
//  Created by Kevin Torres on 17-01-21.
//

import UIKit

// MARK: - IBInspectable
extension UIView {
    @IBInspectable
    var layerCornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
}
