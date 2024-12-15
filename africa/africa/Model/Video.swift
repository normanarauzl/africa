//
//  Video.swift
//  africa
//
//  Created by Norman Arauz on 8/12/24.
//

struct Video: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
  
  // Computed Property
  var thumbnail: String {
    "video-\(id)"
  }
}
