//
//  VideoView.swift
//  Netflix Build
//
//  Created by Stanley Pan on 2021/12/23.
//

import SwiftUI
import AVKit

struct VideoViewer: View {
    var url: URL
    
    private var player: AVPlayer {
        AVPlayer(url: url)
    }
    
    var body: some View {
        VideoPlayer(player: player)
    }
}

struct VideoViewer_Previews: PreviewProvider {
    static var previews: some View {
        VideoViewer(url: exampleVideoURL)
    }
}
