//
//  HomeVM.swift
//  Netflix Build
//
//  Created by Stanley Pan on 2021/12/22.
//

import Foundation

class HomeVM: ObservableObject {
    // String == Movie Category
    @Published var movies: [String: [Movie]] = [:]
    
    public var allCategories: [String] {
        return movies.keys.map({ String($0) })
    }
    
    public func getMovies(forCategory category: String, andHomeRow homeRow: HomeTopRow) -> [Movie] {
        
        switch homeRow {
        case .home:
            return movies[category] ?? []
        case .tvShows:
            return (movies[category] ?? []).filter({ $0.movieType == .tvShow })
        case .movies:
            return (movies[category] ?? []).filter({ $0.movieType == .movie })
        case .myList:
            // TODO: Set this properly
            return movies[category] ?? []
        }
    }
    
    init() {
        setupMovies()
    }
    
    func setupMovies() {
        movies["Trending Now"] = exampleMovies
        movies["Stand-Up Comedy"] = exampleMovies.shuffled()
        movies["New Releases"] = exampleMovies.shuffled()
        movies["Watch It Again"] = exampleMovies.shuffled()
        movies["Sci-Fi Movies"] = exampleMovies.shuffled()
    }
}
