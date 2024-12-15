//
//  VideoPlayerView.swift
//  africa
//
//  Created by Norman Arauz on 15/12/24.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    let selected: String
    let name: String
        
    var body: some View {
        VStack {
            VideoPlayer(player: videoPlayer(fileName: selected, fileExtension: "mp4"))
                .overlay(
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .padding(.top, 6)
                        .padding(.horizontal, 8)
                    , alignment: .topLeading
                )
        }
        .accentColor(.accentColor)
        .navigationBarTitle(name, displayMode: .inline)
    }
    
    private func videoPlayer(fileName: String, fileExtension: String) -> AVPlayer? {
        var videoPlayer: AVPlayer?
        guard let fileUrl = Bundle.main.url(forResource: fileName, withExtension: fileExtension)
        else { return nil }
        
        videoPlayer = AVPlayer(url: fileUrl)
        videoPlayer?.play()
        
        return videoPlayer
    }
}
