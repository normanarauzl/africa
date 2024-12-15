//
//  AnimalGridView.swift
//  africa
//
//  Created by Norman Arauz on 14/12/24.
//

import SwiftUI

struct AnimalGridItemView: View {
  // MARK: - PROPERTIES
  
  let animal: Animal

  // MARK: - BODY

  var body: some View {
    Image(animal.image)
      .resizable()
      .scaledToFit()
      .cornerRadius(12)
  }
}
