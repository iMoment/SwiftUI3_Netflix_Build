//
//  SearchView.swift
//  Netflix Build
//
//  Created by Stanley Pan on 2021/12/27.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var vm = SearchVM()
    
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                SearchBar(searchText: $searchText, isLoading: $vm.isLoading)
                    .padding()
                
                Spacer()
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
