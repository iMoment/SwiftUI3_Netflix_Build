//
//  SearchResultsGrid.swift
//  Netflix Build
//
//  Created by Stanley Pan on 2021/12/28.
//

import SwiftUI

struct SearchResultsGrid: View {
    var movies: [Movie]
    let screen: CGRect = UIScreen.main.bounds
    
    @Binding var movieDetailToShow: Movie?
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(movies, id: \.id) { movie in
                StandardHomeMovie(movie: movie)
                    .frame(width: screen.size.width / 3.25, height: (screen.size.width / 3.25) * 1.333)
                    .clipped()
                    .onTapGesture {
                        self.movieDetailToShow = movie
                    }
            }
        }
    }
}

struct SearchResultsGrid_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsGrid(movies: generateMovies(20), movieDetailToShow: .constant(nil))
    }
}
