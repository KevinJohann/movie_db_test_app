//
//  Parameterizable.swift
//  movieApp
//
//  Created by Kevin Torres on 16-01-21.
//

import Alamofire

// MARK: - Parameterizable
protocol Parameterizable {
    var asParameters: Parameters { get }
}
