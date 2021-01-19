//
//  APIEnvironment.swift
//  movieApp
//
//  Created by Kevin Torres on 16-01-21.
//

import Foundation

// MARK: - APIEnvironment
enum APIEnvironment {
    case prod

    static var current: APIEnvironment { .prod }

    static var baseURL: URL? {
        var baseURLAsString: String {
            switch current {
            case .prod: return "https://api.themoviedb.org/3"
            }
        }

        return URL(string: baseURLAsString)
    }

    static var apiKey: String {
        switch current {
        case .prod: return "000da4474d5cee89e8d192fed8be6ca1"
        }
    }

    static var baseURLImage: String {
        switch current {
        case .prod: return "https://image.tmdb.org/t/p/w500"
        }
    }

}
