//
//  ContentView.swift
//  africa
//
//  Created by Norman Arauz on 8/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isGridViewActive: Bool = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        NavigationStack {
            Group {
                if isGridViewActive {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        }
                        .padding(10)
                    }
                } else {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                          NavigationLink(destination: AnimalDetailView(animal: animal)) {
                            AnimalListItemView(animal: animal)
                          }
                        }
                        
                        CreditsView()
                          .modifier(CenterModifier())
                    }
                    .listStyle(.plain)
                }
            }
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
              ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing: 16) {
                  // LIST
                  Button(action: {
                    print("List view is activated")
                    isGridViewActive = false
                    haptics.impactOccurred()
                  }) {
                    Image(systemName: "square.fill.text.grid.1x2")
                      .font(.title2)
                      .foregroundColor(isGridViewActive ? .primary : .accentColor)
                  }
                  
                  // GRID
                  Button(action: {
                    print("Grid view is activated")
                    isGridViewActive = true
                    haptics.impactOccurred()
                    gridSwitch()
                  }) {
                    Image(systemName: toolbarIcon)
                      .font(.title2)
                      .foregroundColor(isGridViewActive ? .accentColor : .primary)
                  }
                }
              }
            }
        }
    }
    
    private func gridSwitch() {
        withAnimation(.easeIn) {
            gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
            gridColumn = gridLayout.count
            print("Grid Number: \(gridColumn)")
        }
      
      switch gridColumn {
      case 1: toolbarIcon = "square.grid.2x2"
      case 2: toolbarIcon = "square.grid.3x2"
      case 3: toolbarIcon = "rectangle.grid.1x2"
      default: toolbarIcon = "square.grid.2x2"
      }
    }
}
