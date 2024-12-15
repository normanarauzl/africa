//
//  CenterModifier.swift
//  africa
//
//  Created by Norman Arauz on 15/12/24.
//

import SwiftUI

struct CenterModifier: ViewModifier {
  func body(content: Content) -> some View {
    HStack {
      Spacer()
      content
      Spacer()
    }
  }
}
