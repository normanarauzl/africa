//
//  Animal.swift
//  africa
//
//  Created by Norman Arauz on 8/12/24.
//

struct Animal: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
  let description: String
  let link: String
  let image: String
  let gallery: [String]
  let fact: [String]
}
