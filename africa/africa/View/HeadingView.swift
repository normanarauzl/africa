//
//  HeadingView.swift
//  africa
//
//  Created by Norman Arauz on 8/12/24.
//

import SwiftUI

struct HeadingView: View {
    
    let headingImage: String
    let headingText: String
    
    var body: some View {
        HStack {
            Image(headingImage)
                .foregroundStyle(Color.accentColor)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
    }
}
