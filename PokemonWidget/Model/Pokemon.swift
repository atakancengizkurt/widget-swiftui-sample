//
//  Pokemon.swift
//  PokemonWidget
//
//  Created by Atakan Cengiz KURT on 15.05.2021.
//

import Foundation

struct Pokemon: Identifiable, Codable {
  let imageName: String
  let name: String
  let type: String
  
  var id: String{
    imageName
  }
}


let pikachu = Pokemon(imageName: "pikachu", name: "Pikachu", type: "Mouse Pokemon")
let charmander = Pokemon(imageName: "charmander", name: "Charmander", type: "Lizard Pokemon")
let jigglypuff = Pokemon(imageName: "jigglypuff", name: "Jigglypuff", type: "Fairy Pokemon")
