//
//  HomeStack.swift
//  Netflix Build
//
//  Created by Stanley Pan on 2021/12/24.
//

import SwiftUI

struct HomeStack: View {
    var vm: HomeVM
    var topRowSelection: HomeTopRow
    var selectedGenre: HomeGenre
    
    @Binding var movieDetailToShow: Movie?
    
    @Binding var showPreviewFullScren: Bool
    @Binding var previewStartingIndex: Int
    
    var body: some View {
        ForEach(vm.allCategories, id: \.self) { category in
            VStack {
                HStack {
                    Text(category)
                        .font(.title3)
                        .bold()
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(vm.getMovies(forCategory: category, andHomeRow: topRowSelection, andGenre: selectedGenre)) { movie in
                            StandardHomeMovie(movie: movie)
                                .frame(width: 100, height: 200)
                                .padding(.horizontal, 20)
                                .onTapGesture(perform: {
                                    withAnimation(Animation.easeIn(duration: 0.2)) {
                                        movieDetailToShow = movie
                                    }
                                })
                        }
                    }
                }
            }
            .padding(.leading, 6)
        }
    }
}

struct HomeStack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                HomeStack(
                    vm: HomeVM(),
                    topRowSelection: .home,
                    selectedGenre: .AllGenres,
                    movieDetailToShow: .constant(nil),
                    showPreviewFullScren: .constant(false),
                    previewStartingIndex: .constant(0))
            }
            .foregroundColor(.white)
        }
    }
}
