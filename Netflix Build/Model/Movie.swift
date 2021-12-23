//
//  Movie.swift
//  Netflix Build
//
//  Created by Stanley Pan on 2021/12/22.
//

import Foundation

struct Movie: Identifiable {
    var id: String
    var name: String
    var thumbnailURL: URL
    
    var categories: [String]
    
    // MARK: MovieDetailView
    var year: Int
    var rating: String
    var numberOfSeasons: Int?
    
    var episodes: [Episode]?
    
    var promotionHeadline: String?
    
    var numberOfSeasonsDisplay: String {
        if let num = numberOfSeasons {
            if num == 1 {
                return "1 Season"
            } else {
                return "\(num) Seasons"
            }
        }
        
        return ""
    }
}
