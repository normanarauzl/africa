//
//  MapView.swift
//  africa
//
//  Created by Norman Arauz on 8/12/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var position: MapCameraPosition = {
        let mapCoordinates = CLLocationCoordinate2D(latitude: 6.60, longitude: 14.43)
        let mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        let region = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return .region(region)
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    var body: some View {
        Map {
            ForEach(locations) { location in
                Annotation(location.name, coordinate: location.location) {
                    MapAnnotationView(location: location)
                }
            }
        }
        .overlay(
          HStack(alignment: .center, spacing: 12) {
            Image("compass")
              .resizable()
              .scaledToFit()
              .frame(width: 48, height: 48, alignment: .center)
            
            VStack(alignment: .leading, spacing: 3) {
              HStack {
                Text("Latitude:")
                  .font(.footnote)
                  .fontWeight(.bold)
                  .foregroundColor(.accentColor)
                Spacer()
                  Text("\(position.region?.center.latitude)")
                  .font(.footnote)
                  .foregroundColor(.white)
              }
              
              Divider()
              
              HStack {
                Text("Longitude:")
                  .font(.footnote)
                  .fontWeight(.bold)
                  .foregroundColor(.accentColor)
                Spacer()
                  Text("\(position.region?.center.longitude)")
                  .font(.footnote)
                  .foregroundColor(.white)
              }
            }
          } //: HSTACK
          .padding(.vertical, 12)
          .padding(.horizontal, 16)
          .background(
            Color.black
              .cornerRadius(8)
              .opacity(0.6)
          )
          .padding()
          , alignment: .top
        )
    }
}
