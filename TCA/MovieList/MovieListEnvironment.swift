//
//  MovieListEnvironment.swift
//  TCA
//
//  Created by Jade Silveira on 03/05/24.
//

struct MovieListEnvironment {
    let movieListService: MovieListServiceProtocol
    
    init(movieListService: MovieListServiceProtocol) {
        self.movieListService = movieListService
    }
}
