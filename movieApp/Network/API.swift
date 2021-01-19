//
//  API.swift
//  movieApp
//
//  Created by Kevin Torres on 15-01-21.
//

import Alamofire

// MARK: - API
enum API {}

// MARK: - Methods
extension API {
    private static func handle(statusCode: Int, onSuccess: CompletionHandler, onFailure: CompletionHandler) {
        switch statusCode {
        case 401: print("401")
        case 404: print("404")
        default: break
        }
    }

    @discardableResult static func call<T: Decodable>(resource: URLRequestConvertible, onResponse: CompletionHandler = nil, onSuccess: SuccessHandler<T> = nil, onFailure: CompletionHandler = nil) -> DataRequest {
        var jsonDecoder: JSONDecoder {
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            return jsonDecoder
        }

        return AF
            .request(resource)
            .responseString { print($0) }
            .responseDecodable(decoder: jsonDecoder) {
                (response: AFDataResponse<T>) in

                print("API.call() Response: \(response)")

                if let statusCode = response.response?.statusCode {
                    handle(
                        statusCode: statusCode,
                        onSuccess: { call(resource: resource, onResponse: onResponse, onSuccess: onSuccess, onFailure: onFailure) },
                        onFailure: onFailure
                    )
                }

                onResponse?()

                switch response.result {
                case .success(let decodedObject): onSuccess?(decodedObject)
                case .failure(let error):
                    print("error.localizedDescription: \(error.localizedDescription)")
                    onFailure?()
                }
        }
    }
}
