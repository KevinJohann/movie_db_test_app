//
//  MediaRemoteManager.swift
//  movieApp
//
//  Created by Kevin Torres on 16-01-21.
//

import Alamofire

// MARK: - CategoryContentParameters
struct CollectionContentParameters: Parameterizable {
    var asParameters: Parameters {
        ["api_key": APIEnvironment.apiKey]
    }
}

// MARK: - MediaRemoteManagerProtocol
protocol MediaRemoteManagerProtocol: AnyObject {
    func getUpcomingCollection(parameters: CollectionContentParameters)
    func getMovieDetail(using id: String, parameters: CollectionContentParameters)
}

// MARK: - GetCollectionsOutputProtocol
protocol GetCollectionsOutputProtocol: AnyObject {
    func onGetUpcomingCollectionResponse()
    func onGetUpcomingCollectionSuccess(response: UpComingMoviesResponse)
    func onGetUpcomingCollectionFailure()
}

// MARK: - GetMovieDetailOutputProtocol
protocol GetMovieDetailOutputProtocol: AnyObject {
    func onGetMovieDetailResponse()
    func onGetMovieDetailSuccess(response: DetailMoviesResponse)
    func onGetMovieDetailFailure()
}

// MARK: - MediaRemoteManager
final class MediaRemoteManager {
    weak var getCollectionsOutputProtocol: GetCollectionsOutputProtocol?
    weak var getMovieDetailOutputProtocol: GetMovieDetailOutputProtocol?

    private var currentGetCollectionsRequest: DataRequest?
    private var currentGetMovieDetailRequest: DataRequest?
}

// MARK: - MediaRemoteManagerProtocol
extension MediaRemoteManager: MediaRemoteManagerProtocol {
    func getUpcomingCollection(parameters: CollectionContentParameters) {
        currentGetCollectionsRequest?.suspend()

        currentGetCollectionsRequest = API.call(
            resource: AppRouter.movie(parameters),
            onResponse: { self.getCollectionsOutputProtocol?.onGetUpcomingCollectionResponse() },
            onSuccess: { (response: UpComingMoviesResponse) in
                self.getCollectionsOutputProtocol?.onGetUpcomingCollectionSuccess(response: response)
            },
            onFailure: { self.getCollectionsOutputProtocol?.onGetUpcomingCollectionFailure() }
        )
    }

    func getMovieDetail(using id: String, parameters: CollectionContentParameters) {
        currentGetMovieDetailRequest?.suspend()

        currentGetMovieDetailRequest = API.call(
            resource: AppRouter.movieDetail(id: id, parameters: parameters),
            onResponse: { self.getMovieDetailOutputProtocol?.onGetMovieDetailResponse() },
            onSuccess: { (response: DetailMoviesResponse) in
                print(response)
                self.getMovieDetailOutputProtocol?.onGetMovieDetailSuccess(response: response)
            },
            onFailure: { self.getMovieDetailOutputProtocol?.onGetMovieDetailFailure() }
        )
    }
}

// MARK: - UpComingMoviesResponse
struct UpComingMoviesResponse: Codable {
    var results: [UpcomingMoviesModel]
    var pages: Int?
    var totalResults: Int?
    var totalPages: Int?
}

// MARK: - UpcomingMoviesModel
struct UpcomingMoviesModel: Codable {
    var voteCount: Int?
    var id: Int
    var video: Bool?
    var voteAverage: Float
    var title: String
    var popularity: Double?
    var posterPath: String
    var originalLanguage: String
    var originalTitle: String
    var genreIds: [Int]?
    var backdropPath: String?
    var adule: Bool?
    var overview: String
    var releaseDate: String
}

// MARK: - DetailMoviesResponse
struct DetailMoviesResponse: Codable {
    let adult: Bool?
    let backdropPath: String
    let belongsToCollection: BelongsToCollection?
    let budget: CUnsignedLongLong?
    let genres: [MovieGenresModel]?
    let homepage: String
    let id: Int?
    let imdbId, originalLanguage, originalTitle: String?
    let overview: String
    let popularity: Double
    let posterPath: String
    let productionCompanies: [ProductionCompany]?
    let releaseDate: String?
    let revenue, runtime: Int?
    let status, tagline: String?
    let title: String
    let video: Bool?
    let voteAverage: Double
    let voteCount: Int
}

// MARK: - MovieGenresModel
struct MovieGenresModel : Codable {
    var id: Int?
    var name: String?
}

// MARK: - BelongsToCollection
struct BelongsToCollection: Codable {
    let id: Int?
    let name, posterPath, backdropPath: String?
}

// MARK: - ProductionCompany
struct ProductionCompany: Codable {
    let id: Int?
    let logoPath: String?
    let name, originCountry: String?
}
