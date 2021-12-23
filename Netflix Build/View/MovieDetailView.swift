//
//  MovieDetailView.swift
//  Netflix Build
//
//  Created by Stanley Pan on 2021/12/23.
//

import SwiftUI

struct MovieDetailView: View {
    var movie: Movie
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
                        // TODO: Close this view
                    } label: {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 28))
                    }
                }
                .padding(.horizontal, 22)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        StandardHomeMovie(movie: movie)
                            .frame(width: screen.width / 2.5)
                        
                        MovieInfoSubheadline(movie: movie)
                        
                        Text("Watch Season 3 Now")
                        
                        if movie.promotionHeadline != nil {
                            Text(movie.promotionHeadline!)
                                .bold()
                                .font(.headline)
                        } else {
                            Text("Watch Now")
                                .bold()
                                .font(.headline)
                        }
                    }
                }
                
                Spacer()
            }
            .foregroundColor(.white)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: exampleMovie5)
    }
}

struct MovieInfoSubheadline: View {
    var movie: Movie
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.white)
            
            Text(String(movie.year))
            
            RatingView(rating: movie.rating)
            
            Text(movie.numberOfSeasonsDisplay)
            
            HDView()
        }
        .foregroundColor(.gray)
        .padding(.vertical, 6)
    }
}

struct RatingView: View {
    var rating: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 57/255, green: 59/255, blue: 63/255))
                .cornerRadius(2.0)
            
            Text(rating)
                .foregroundColor(.white)
                .font(.system(size: 12))
                .bold()
        }
        .frame(width: 54, height: 26)
    }
}

struct HDView: View {
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
                .cornerRadius(2.0)
            
            Rectangle()
                .foregroundColor((Color(red: 37/255, green: 39/255, blue: 43/255)))
                .frame(width: 30, height: 22)
                .cornerRadius(2.0)
                
            
            Text("HD")
                .foregroundColor(.white)
                .font(.system(size: 14))
                .bold()
                
        }
        .frame(width: 34, height: 26)
    }
}
