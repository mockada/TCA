//
//  MovieDetailsView.swift
//  TCA
//
//  Created by Jade Silveira on 03/05/24.
//

import SwiftUI
import ComposableArchitecture

struct MovieDetailsView: View {
    @ComposableArchitecture.Bindable var store: StoreOf<MovieDetailsReducer>
    
    var body: some View {
        Text(store.movieResponse?.title ?? "Title")
    }
}

//#Preview {
//    MovieDetailsView()
//}
