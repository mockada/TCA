//
//  MovieListService.swift
//  TCA
//
//  Created by Jade Silveira on 03/05/24.
//

import NatworkSPM

protocol MovieListServiceProtocol {
    func fetchDailyTrendingMovieList() async -> Result<MovieListResponse, ApiError>
    func search(movieText: String, page: Int) async -> Result<MovieListResponse, ApiError>
    func search(movieId: String) async -> Result<MovieResponse, ApiError>
}

final class MovieListService: MovieListServiceProtocol {
    private let network: NetworkCoreProtocol
    
    init(network: NetworkCoreProtocol) {
        self.network = network
    }
    
    func fetchDailyTrendingMovieList() async -> Result<MovieListResponse, ApiError> {
        let endpoint: EndpointProtocol = TrendingDailyEndpoint()
        return await network.fetchDecodedDataWithURLAsync(endpoint: endpoint, resultType: MovieListResponse.self)
    }
    
    func search(movieText: String, page: Int) async -> Result<MovieListResponse, ApiError> {
        let endpoint: EndpointProtocol = SearchTextEndpoint(text: movieText, page: page.description)
        return await network.fetchDecodedDataWithURLAsync(endpoint: endpoint, resultType: MovieListResponse.self)
    }
    
    func search(movieId: String) async -> Result<MovieResponse, ApiError> {
        let endpoint: EndpointProtocol = MovieSearchIdEndpoint(id: movieId)
        return await network.fetchDecodedDataWithURLAsync(endpoint: endpoint, resultType: MovieResponse.self)
    }
}
