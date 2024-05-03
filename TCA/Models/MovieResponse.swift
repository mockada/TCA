//
//  MovieResponse.swift
//  TCA
//
//  Created by Jade Silveira on 03/05/24.
//

struct MovieResponse: Decodable, Equatable, Identifiable {
    let id: Int
    let posterPath: String?
    let title: String
    let overview: String
}
