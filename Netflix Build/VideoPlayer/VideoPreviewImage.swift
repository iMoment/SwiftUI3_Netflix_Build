//
//  VideoPreviewImage.swift
//  Netflix Build
//
//  Created by Stanley Pan on 2021/12/23.
//

import SwiftUI
import Kingfisher

struct VideoPreviewImage: View {
    var imageURL: URL
    var videoURL: URL
    
    @State private var isShowingVideoPlayer: Bool = false
    
    var body: some View {
        ZStack {
            KFImage(imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            Button(action: {
                isShowingVideoPlayer = true
            }, label: {
                Image(systemName: "play.circle")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
            })
            .sheet(isPresented: $isShowingVideoPlayer, content: {
                VideoViewer(url: videoURL)
            })
        }
    }
}

struct VideoPreviewImage_Previews: PreviewProvider {
    static var previews: some View {
        VideoPreviewImage(imageURL: exampleImageURL, videoURL: exampleVideoURL)
    }
}
