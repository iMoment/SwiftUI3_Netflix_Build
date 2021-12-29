//
//  ComingSoonVM.swift
//  Netflix Build
//
//  Created by Stanley Pan on 2021/12/28.
//

import Foundation

class ComingSoonVM: ObservableObject {
    @Published var movies: [Movie] = []
    
    init() {
        self.movies = generateMovies(20)
    }
}
