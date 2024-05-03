//
//  MovieListResponse.swift
//  TCA
//
//  Created by Jade Silveira on 03/05/24.
//

struct MovieListResponse: Decodable, Equatable {
    let page: Int
    let results: [MovieResponse]
    let totalPages: Int
    let totalResults: Int
}
