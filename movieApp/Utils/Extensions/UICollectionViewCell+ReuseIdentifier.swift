//
//  UICollectionViewCell+ReuseIdentifier.swift
//  movieApp
//
//  Created by Kevin Torres on 16-01-21.
//

import UIKit

extension UICollectionReusableView {
    static var reuseIdentifier: String { String(describing: self) }
}
