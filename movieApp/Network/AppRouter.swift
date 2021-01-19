//
//  AppRouter.swift
//  movieApp
//
//  Created by Kevin Torres on 15-01-21.
//

import Foundation
import Alamofire

// MARK: - AppRouter
enum AppRouter: URLRequestConvertible {
    case movie(Parameterizable)
    case movieDetail(id: String, parameters: Parameterizable)

    // MARK: - Service Path
    var servicePath: String {
        return "/movie"
    }

    // MARK: - Path
    var path: String {
        switch self {
        case .movie: return "/upcoming"
        case .movieDetail(let id, _): return "/\(id)"
        }
    }

    // MARK: - BaseURL
    var baseURL: URL? { APIEnvironment.baseURL }

    // MARK: - URL
    var url: URL? {
        switch APIEnvironment.current {
        case .prod:
            return baseURL?.appendingPathComponent("\(servicePath)\(path)")
        }
    }

    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .movie, .movieDetail: return .get
        }
    }

    // MARK: - Headers
    var headers: HTTPHeaders {
        switch self {
        default: return [HTTPHeader(name: "Accept", value: "application/json")]
        }
    }

    // MARK: - Parameters
    var parameters: Parameters {
        switch self {
        case .movie(let parameters): return parameters.asParameters
        case .movieDetail(_, let parameters): return parameters.asParameters
        }
    }

    // MARK: - asURLRequest
    func asURLRequest() throws -> URLRequest {
        guard let url = url else { return URLRequest(url: URL(string: .empty)!) }

        var urlRequest = URLRequest(url: url)

        defer {
            print("urlRequest: \(urlRequest)")
            print("urlRequest.allHTTPHeaderFields: \(String(describing: urlRequest.allHTTPHeaderFields))")
            print("Parameters: \(parameters)")
        }

        // MARK: - HTTPMethod
        urlRequest.httpMethod = method.rawValue

        // MARK: - Headers
        headers.forEach { urlRequest.headers.add($0) }

        // MARK: - Parameters Encoding
        switch method {
        case .get: return try URLEncoding.default.encode(urlRequest, with: parameters)
        default: return try JSONEncoding.default.encode(urlRequest, with: parameters)
        }
    }
}
