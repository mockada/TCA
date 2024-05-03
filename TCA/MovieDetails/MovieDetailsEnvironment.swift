//
//  MovieDetailsEnvironment.swift
//  TCA
//
//  Created by Jade Silveira on 03/05/24.
//

struct MovieDetailsEnvironment {
    let movieDetailsService: MovieDetailsServiceProtocol
    
    init(movieDetailsService: MovieDetailsServiceProtocol) {
        self.movieDetailsService = movieDetailsService
    }
}
