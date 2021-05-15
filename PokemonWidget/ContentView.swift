//
//  ContentView.swift
//  PokemonWidget
//
//  Created by Atakan Cengiz KURT on 15.05.2021.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
  
  @AppStorage("pokemon", store: UserDefaults(suiteName: "group.atakancengizkurt.PokemonWidget"))
  var pokemonData: Data = Data()
  
  
    var body: some View {
      VStack{
        ForEach(pokemonArray){ pokemon in
          PokemonView(pokemon: pokemon).onTapGesture(count: 1, perform: {
            self.saveToUserDefaults(pokemon: pokemon)
          })
          
        }
        Spacer()
      }
    }
  
  
  func saveToUserDefaults(pokemon: Pokemon){
    if let pokemonData = try? JSONEncoder().encode(pokemon){
      self.pokemonData = pokemonData
//      WidgetCenter.shared.reloadAllTimelines()
      WidgetCenter.shared.reloadTimelines(ofKind: "WidgetPokemon")
      print(pokemon.name)
    }
    
  }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
