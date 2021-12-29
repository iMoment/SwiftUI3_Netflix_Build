//
//  SearchView.swift
//  Netflix Build
//
//  Created by Stanley Pan on 2021/12/27.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var vm: SearchVM = SearchVM()
    
    @State private var searchText: String = ""
    
    @State private var movieDetailToShow: Movie? = nil
    
    var body: some View {
        // MARK: custom binding
        let searchTextBinding = Binding {
            return searchText
        } set: {
            searchText = $0
            vm.updateSearchText(with: $0)
        }
        
        return ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                SearchBar(searchText: searchTextBinding, isLoading: $vm.isLoading)
                    .padding()
                
                ScrollView {
                    if vm.isShowingPopularMovies {
                        PopularList(movies: vm.popularMovies, movieDetailToShow: $movieDetailToShow)
                    }
                    
                    if vm.viewState == .empty {
                        Text("Your search did not have any results.")
                            .bold()
                            .padding(.top, 150)
                    } else if vm.viewState == .ready && !vm.isShowingPopularMovies {
                        VStack {
                            HStack {
                                Text("Movies & TV")
                                    .bold()
                                    .font(.title3)
                                    .padding(.leading, 12)
    
                                Spacer()
                            }
                            
                            SearchResultsGrid(movies: vm.searchResults, movieDetailToShow: $movieDetailToShow)
                        }
                    }
                }
                
                Spacer()
            }
            // TODO: Animation like HomeView
            if movieDetailToShow != nil {
                MovieDetailView(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow)
            }
        }
        .foregroundColor(.white)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct PopularList: View {
    var movies: [Movie]
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular Searches")
                    .bold()
                    .font(.title3)
                    .padding(.leading, 12)
                
                Spacer()
            }
            
            LazyVStack {
                ForEach(movies, id: \.id) { movie in
                    PopularMovieView(movie: movie, movieDetailToShow: $movieDetailToShow)
                        .frame(height: 75)
                }
            }
        }
    }
}
