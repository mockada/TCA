//
//  MovieListView.swift
//  TCA
//
//  Created by Jade Silveira on 02/05/24.
//

import SwiftUI
import ComposableArchitecture

struct MovieListView: View {
    @ComposableArchitecture.Bindable var store: StoreOf<MovieListReducer>
    @State private var selectedMovie: MovieResponse? = nil
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Search movie", text: $store.searchText.sending(\.searchTextChanged))
                }
                
                Section {
                    Button("Trending daily movies") { store.send(.movieListButtonTapped) }
                }
                
                if let apiError = store.apiError {
                    Section {
                        Text("\(apiError.localizedDescription)")
                    }
                }
                
                if let results = store.movieListResponse?.results {
                    List {
                        ForEach(results) { movie in
                            Button {
                                selectedMovie = movie
                            } label: {
                                Text(movie.title)
                            }
                            .navigationDestination(
                                isPresented: Binding(
                                    get: { selectedMovie == movie },
                                    set: { if !$0 { selectedMovie = nil } }
                                ),
                                destination: {
                                    MovieDetailsView(store: Store(
                                        initialState: MovieDetailsReducer.State(movieResponse: selectedMovie)
                                    ) {
                                        MovieDetailsReducer()
                                    })
                                }
                            )
                        }
                    }
                }
            }
        }
    }
}

//struct MovieListView_Previews: PreviewProvider {
//    static var previews: some View {
//        let reducer: () -> MovieListReducer = { MovieListReducer() }
//        let store: Store = .init(
//            initialState: MovieListReducer.State(),
//            reducer: reducer
//        )
//        MovieListView(store: store)
//    }
//}
