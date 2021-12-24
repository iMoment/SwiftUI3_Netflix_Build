//
//  Netflix_BuildApp.swift
//  Netflix Build
//
//  Created by Stanley Pan on 2021/12/22.
//

import SwiftUI

@main
struct Netflix_BuildApp: App {
    var body: some Scene {
        WindowGroup {
//            HomeView()
            MovieDetailView(movie: exampleMovie6)
        }
    }
}
