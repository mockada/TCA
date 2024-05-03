//
//  MovieDetailsReducer.swift
//  TCA
//
//  Created by Jade Silveira on 03/05/24.
//

import ComposableArchitecture
import NatworkSPM

@Reducer
struct MovieDetailsReducer {
    @ObservableState
    struct State: Equatable {
        var isLoading: Bool = false
        var movieResponse: MovieResponse?
        var apiError: ApiError?
    }
    enum Action {
        case searchMovieId(String)
        case movieDetails(Result<MovieResponse, ApiError>)
    }
    private let environment: MovieDetailsEnvironment = .init(
        movieDetailsService: MovieDetailsService(network: NetworkCore())
    )
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .searchMovieId(let movieId):
                state.isLoading = true
                
                return .run { send in
                    let result = await environment.movieDetailsService.search(movieId: movieId)
                    await send(.movieDetails(result))
                }
                
            case .movieDetails(let result):
                state.isLoading = false
                
                if case .success(let movieResponse) = result {
                    state.movieResponse = movieResponse
                } else if case .failure(let apiError) = result {
                    state.apiError = apiError
                } else {
                    state.apiError = .generic
                }
                return .none
            }
        }
    }
}
