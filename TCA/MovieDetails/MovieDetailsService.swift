//
//  MovieDetailsService.swift
//  TCA
//
//  Created by Jade Silveira on 03/05/24.
//

import NatworkSPM

protocol MovieDetailsServiceProtocol {
    func search(movieId: String) async -> Result<MovieResponse, ApiError>
}

final class MovieDetailsService: MovieDetailsServiceProtocol {
    private let network: NetworkCoreProtocol
    
    init(network: NetworkCoreProtocol) {
        self.network = network
    }
    
    func search(movieId: String) async -> Result<MovieResponse, ApiError> {
        let endpoint: EndpointProtocol = MovieSearchIdEndpoint(id: movieId)
        return await network.fetchDecodedDataWithURLAsync(endpoint: endpoint, resultType: MovieResponse.self)
    }
}

