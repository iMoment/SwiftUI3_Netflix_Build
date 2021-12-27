//
//  SearchBar.swift
//  Netflix Build
//
//  Created by Stanley Pan on 2021/12/27.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @State private var isEditing: Bool = true
    @Binding var isLoading: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.graySearchBackground
                .frame(width: 270, height: 36)
                .cornerRadius(8)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.graySearchText)
                    .padding(.leading, 10)
                
                TextField("Search", text: $searchText)
                    .padding(7)
                    .padding(.leading, -7)
                    .background(Color.graySearchBackground)
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .onTapGesture {
                        isEditing = true
                    }
                
                if !searchText.isEmpty {
                    if isLoading {
                        Button(action: {
                            searchText = ""
                        }, label: {
                            ActivityIndicator(style: .medium, animate: .constant(true))
                                .configure {
                                    $0.color = .white
                                }
                        })
                        .padding(.trailing, 32)
                        .frame(width: 35, height: 35)
                    } else {
                        Button(action: {
                            searchText = ""
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.graySearchText)
                                .frame(width: 35, height: 35)
                        })
                        .padding(.trailing, 18)
                    }
                }
                
                if isEditing {
                    Button(action: {
                        searchText = ""
                        isEditing = false
                        hideKeyboard()
                    }, label: {
                        Text("Cancel")
                            .foregroundColor(.white)
                    })
                    .padding(.trailing, 10)
                }
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            SearchBar(searchText: .constant(""), isLoading: .constant(false))
                .padding()
        }
    }
}
