//
//  ContentView.swift
//  Netflix Build
//
//  Created by Stanley Pan on 2021/12/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showPreviewFullScreen: Bool = false
    @State private var previewStartingIndex: Int = 0
    @State private var previewCurrentPosition: CGFloat = 1000
    @State private var previewNewPosition: CGFloat = 1000
    @State private var previewHorizontalDragActive: Bool = false
    
    let screen = UIScreen.main.bounds
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor.black
    }
    
    var body: some View {
        
        let previewDragGesture = DragGesture(minimumDistance: 20)
            .onChanged { value in
                
                if previewHorizontalDragActive { return }
                
                if previewCurrentPosition == .zero {
                    if abs(value.translation.width) > abs(value.translation.height) {
                        previewHorizontalDragActive = true
                        return
                    }
                }
                
                // Vertical
                let intendedPosition = value.translation.height + self.previewNewPosition
                
                if intendedPosition < 0 {
                    return
                } else {
                    self.previewCurrentPosition = intendedPosition
                }
            }
            .onEnded { value in
                if previewHorizontalDragActive {
                    previewHorizontalDragActive = false
                    return
                }
                
                let intendedPosition = value.translation.height + self.previewNewPosition
                
                if intendedPosition < 0 {
                    self.previewCurrentPosition = .zero
                    self.previewNewPosition = .zero
                } else {
                    let closingPoint = screen.size.height * 0.4
                    if intendedPosition > closingPoint {
                        withAnimation {
                            self.showPreviewFullScreen = false
                            self.previewCurrentPosition = screen.height + 20
                            self.previewNewPosition = screen.height + 20
                        }
                    } else {
                        withAnimation {
                            self.previewNewPosition = .zero
                            self.previewCurrentPosition = .zero
                        }
                    }
                }
                
                previewHorizontalDragActive = false
            }
        
        return ZStack {
            TabView {
                HomeView(
                    showPreviewFullScren: $showPreviewFullScreen,
                    previewStartingIndex: $previewStartingIndex)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }.tag(0)
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }.tag(1)
                
                ComingSoonView()
                    .tabItem {
                        Image(systemName: "play.rectangle")
                        Text("Coming Soon")
                    }.tag(2)
                
                DownloadsView()
                    .tabItem {
                        Image(systemName: "arrow.down.to.line.alt")
                        Text("Downloads")
                    }.tag(3)
                
                Text("MoreView")
                    .tabItem {
                        Image(systemName: "equal")
                        Text("More")
                    }.tag(4)
            }
            .accentColor(.white)
            
            PreviewList(
                movies: exampleMovies,
                currentSelection: $previewStartingIndex,
                isVisible: $showPreviewFullScreen,
                externalDragGesture: previewDragGesture
            )
            .offset(y: previewCurrentPosition)
            .isHidden(!showPreviewFullScreen)
            .animation(.easeIn)
//            .animation(Animation.easeIn, value: showPreviewFullScreen)
            .transition(.move(edge: .bottom))
        }
        .onChange(of: showPreviewFullScreen, perform: { value in
            if value {
                withAnimation {
                    previewCurrentPosition = .zero
                    previewNewPosition = .zero
                }
            } else {
                withAnimation {
                    self.previewCurrentPosition = screen.height + 20
                    self.previewNewPosition = screen.height + 20
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
