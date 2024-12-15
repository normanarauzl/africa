//
//  CoverImageView.swift
//  africa
//
//  Created by Norman Arauz on 8/12/24.
//

import SwiftUI

struct CoverImageView: View {
    
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    var body: some View {
        TabView {
            ForEach(coverImages) { cover in
                Image(cover.name)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}


#Preview {
    CoverImageView()
}
