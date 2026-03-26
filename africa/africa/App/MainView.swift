//
//  MainView.swift
//  africa
//
//  Created by Norman Arauz on 8/12/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Tab("Browse", systemImage: "square.grid.2x2") {
                ContentView()
            }
            
            Tab("Watch", systemImage: "play.rectangle") {
                VideoListView()
            }
            
            Tab("Locations", systemImage: "map") {
                MapView()
            }
            
            Tab("Gallery", systemImage: "photo") {
                GalleryView()
            }
        }
    }
}

#Preview {
    MainView()
}
