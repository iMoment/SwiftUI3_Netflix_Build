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
    
    @State private var isShowingSeasonPicker: Bool = false
    @State private var selectedSeason: Int = 1
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.9)
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                VStack {
                    HStack {
                        Spacer()
                        
                        Button {
                            movieDetailToShow = nil
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
                            
                            if movie.promotionHeadline != nil {
                                Text(movie.promotionHeadline!)
                                    .bold()
                                    .font(.headline)
                            } else {
                                Text("Watch Now")
                                    .bold()
                                    .font(.headline)
                            }
                            
                            PlayButton(text: "Play", imageName: "play.fill", backgroundColor: .red) {
                                // TODO: Action
                            }
                            
                            // MARK: Current Episode Information
                            CurrentEpisodeInformation(movie: movie)
                            
                            CastInfo(movie: movie)
                            
                            HStack(spacing: 60) {
                                SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                                    // TODO: action
                                }
                                
                                SmallVerticalButton(text: "Rate", isOnImage: "hand.thumbsup.fill", isOffImage: "hand.thumbsup", isOn: true) {
                                    // TODO: action
                                }
                                
                                SmallVerticalButton(text: "Share", isOnImage: "square.and.arrow.up", isOffImage: "square.and.arrow.up", isOn: true) {
                                    // TODO: action
                                }
                                
                                Spacer()
                            }
                            .padding(.leading, 20)
                            
                            // MARK: Picker + conditional render of views
                            CustomTabSwitcher(tabs: [.episodes, .trailers, .more], movie: movie, isShowingSeasonPicker: $isShowingSeasonPicker, selectedSeason: $selectedSeason)
                            
                        }
                        .padding(.horizontal, 10)
                    }
                    
                    Spacer()
                }
                .foregroundColor(.white)
                
                if isShowingSeasonPicker {
                    Group {
                        Color.black.opacity(0.9)
                        
                        VStack(spacing: 40) {
                            Spacer()
                            
                            ForEach(0..<(movie.numberOfSeasons ?? 0)) { season in
                                Button(action:  {
                                    self.selectedSeason = season + 1
                                    self.isShowingSeasonPicker = false
                                }, label: {
                                    Text("Season \(season + 1)")
                                        .foregroundColor(selectedSeason == season + 1 ? .white : .gray)
                                        .bold()
                                        .font(selectedSeason == season + 1 ? .title : .title2)
                                })
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                self.isShowingSeasonPicker = false
                            }, label: {
                                Image(systemName: "x.circle.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 40))
                                    .scaleEffect(x: 1.1)
                            })
                            .padding(.bottom, 30)
                        }
                    }
                    .edgesIgnoringSafeArea(.all)
                }
            }
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: exampleMovie1, movieDetailToShow: .constant(nil))
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
                .frame(width: 28, height: 20)
                .cornerRadius(2.0)
                
            
            Text("HD")
                .foregroundColor(.white)
                .font(.system(size: 14))
                .bold()
                
        }
        .frame(width: 32, height: 24)
    }
}

struct CastInfo: View {
    var movie: Movie
    
    var body: some View {
        VStack(spacing: 3) {
            HStack {
                Text("Cast: \(movie.cast)")
                
                Spacer()
            }
            
            HStack {
                Text("Creators: \(movie.creators)")
                
                Spacer()
            }
        }
        .font(.caption)
        .foregroundColor(.gray)
        .padding(.vertical, 6)
    }
}

struct CurrentEpisodeInformation: View {
    var movie: Movie
    
    var body: some View {
        Group {
            HStack {
                Text(movie.episodeInfoDisplay)
                    .bold()
                
                Spacer()
            }
            .padding(.vertical, 4)
            
            HStack {
                Text(movie.episodeDescriptionDisplay)
                    .font(.subheadline)
                
                Spacer()
            }
        }
    }
}
