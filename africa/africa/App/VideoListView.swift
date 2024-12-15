//
//  VideoListView.swift
//  africa
//
//  Created by Norman Arauz on 15/12/24.
//

import SwiftUI

struct VideoListView: View {
    
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        NavigationStack {
            List(videos) { video in
                NavigationLink(destination: VideoPlayerView(selected: video.id, name: video.name)) {
                    VideoListItemView(video: video)
                        .padding(.vertical)
                }
            }
        }
    }
}
