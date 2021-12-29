//
//  ComingSoonView.swift
//  Netflix Build
//
//  Created by Stanley Pan on 2021/12/28.
//

import SwiftUI

struct ComingSoonView: View {
    @State private var showNotificationList = false
    @State private var movieDetailToShow: Movie? = nil
    @State private var navBarHidden = true
    
    @State private var scrollOffset: CGFloat = 0.0
    @State private var activeIndex: Int = 0
    
    @ObservedObject var vm = ComingSoonVM()
    
    func updateActiveIndex(fromScroll scroll: CGFloat) {
        if scroll < 105 {
            activeIndex = 0
        } else {
            let temp = scroll - 105
            
            let active = Int(temp / 410) + 1
            activeIndex = Int(active)
        }
    }
    
    var body: some View {
        let movies = vm.movies.enumerated().map({ $0 })
        
        let scrollTrackingBinding = Binding {
            return scrollOffset
        } set: { newVal in
            scrollOffset = newVal
            updateActiveIndex(fromScroll: newVal)
        }
        
//        NavigationView {
        return Group {
                ZStack {
                    Color.black
                        .edgesIgnoringSafeArea(.all)
                    
                    TrackableScrollView(.vertical, showIndicators: false, contentOffset: scrollTrackingBinding) {
                        
                        LazyVStack {
                            NotificationBar(showNotificationList: $showNotificationList)
                            
                            ForEach(Array(movies), id: \.offset) { index, movie in
                                ComingSoonRow(movie: movie, movieDetailToShow: $movieDetailToShow)
                                    .frame(height: 400)
                                    .overlay(
                                        index == activeIndex ? Color.clear : Color.black.opacity(0.8)
                                    )
                                    .animation(.easeInOut, value: activeIndex)
                            }
                        }
                    }
                    .foregroundColor(.white)
                    
                    NavigationLink(
                        destination: Text("Notifications List"),
                        isActive: $showNotificationList,
                        label: {
                            EmptyView()
                        })
                        .navigationTitle("")
                        .navigationBarHidden(navBarHidden)
                        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification), perform: { _ in
                            self.navBarHidden = true
                        })
                        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: { _ in
                            self.navBarHidden = false
                        })
                }
            }
//        }
    }
}

struct ComingSoonView_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoonView()
    }
}
