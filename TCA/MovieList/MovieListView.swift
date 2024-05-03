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
    
    var body: some View {
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
                        let movieDetailsView: MovieDetailsView = .init(
                            store: Store(initialState: MovieDetailsReducer.State(movieResponse: movie)) {
                                MovieDetailsReducer()
                            }
                        )
                        NavigationLink(destination: movieDetailsView) {
                            Text(movie.title)
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
