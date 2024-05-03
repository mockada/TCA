//
//  TCAApp.swift
//  TCA
//
//  Created by Jade Silveira on 02/05/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCAApp: App {
    var body: some Scene {
        WindowGroup {
            MovieListView(
                store: Store(initialState: MovieListReducer.State()) {
                    MovieListReducer()
                }
            )
        }
    }
}
