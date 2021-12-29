//
//  PreviewVM.swift
//  Netflix Build
//
//  Created by Stanley Pan on 2021/12/29.
//

import Foundation

class PreviewVM: ObservableObject {
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}
