//
//  InsetMapView.swift
//  africa
//
//  Created by Norman Arauz on 14/12/24.
//

import SwiftUI
import MapKit

struct InsetMapView: View {

  @State private var position: MapCameraPosition = .automatic

  var body: some View {
      
      Map(position: $position)
      .overlay(
        NavigationLink(destination: MapView()) {
          HStack {
            Image(systemName: "mappin.circle")
              .foregroundColor(Color.white)
              .imageScale(.large)
            
            Text("Locations")
              .foregroundColor(.accentColor)
              .fontWeight(.bold)
          }
          .padding(.vertical, 10)
          .padding(.horizontal, 14)
          .background(
            Color.black
              .opacity(0.4)
              .cornerRadius(8)
          )
        }
        .padding(12)
        , alignment: .topTrailing
      )
      .frame(height: 256)
      .cornerRadius(12)
  }
}
