//
//  SearchBar.swift
//  Netflix Build
//
//  Created by Stanley Pan on 2021/12/27.
//

import SwiftUI

struct SearchBar: View {
    @State private var searchText: String = ""
    
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
                
                Button(action: {
                    // TODO: clear text, test commit
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.graySearchText)
                        .frame(width: 35, height: 35)
                })
                .padding(.trailing, 18)
                
                Button(action: {
                    // TODO: clear text, hide both buttons, give up first-responder
                }, label: {
                    Text("Cancel")
                        .foregroundColor(.white)
                })
                .padding(.trailing, 10)
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            SearchBar()
                .padding()
        }
    }
}
