//
//  MovieList.swift
//  TCA
//
//  Created by Jade Silveira on 02/05/24.
//

import ComposableArchitecture
import NatworkSPM

@Reducer
struct MovieListReducer {
    @ObservableState
    struct State: Equatable {
        var isLoading: Bool = false
        var searchText: String = ""
        var movieListResponse: MovieListResponse?
        var apiError: ApiError?
    }
    enum Action {
        case movieListButtonTapped
        case movieListResponse(Result<MovieListResponse, ApiError>)
        case searchTextChanged(String)
    }
    private let environment: MovieListEnvironment = .init(
        movieListService: MovieListService(network: NetworkCore())
    )
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .movieListButtonTapped:
                state.isLoading = true
                
                return .run { send in
                    let result = await environment.movieListService.fetchDailyTrendingMovieList()
                    await send(.movieListResponse(result))
                }
                
            case .movieListResponse(let result):
                state.isLoading = false
                
                if case .success(let movieListResponse) = result {
                    state.movieListResponse = movieListResponse
                } else if case .failure(let apiError) = result {
                    state.apiError = apiError
                } else {
                    state.apiError = .generic
                }
                return .none
                
            case .searchTextChanged(let text):
                state.isLoading = true
                
                return .run { send in
                    let result = await environment.movieListService.search(movieText: text, page: 1)
                    await send(.movieListResponse(result))
                }
            }
        }
    }
}
