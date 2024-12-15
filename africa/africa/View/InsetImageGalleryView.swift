//
//  InsetImageGalleryView.swift
//  africa
//
//  Created by Norman Arauz on 8/12/24.
//

import SwiftUI

struct InsetImageGalleryView: View {
    
    let animal: Animal
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) {
                    Image($0)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
        }
    }
}
