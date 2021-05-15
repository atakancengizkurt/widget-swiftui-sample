//
//  PokemonView.swift
//  PokemonWidget
//
//  Created by Atakan Cengiz KURT on 15.05.2021.
//

import SwiftUI

struct PokemonView: View {
  var pokemon: Pokemon
    var body: some View {
      HStack{
      SpecialImageView(image: Image(pokemon.imageName))
        .frame(width: 100, height: 100, alignment: .center)
        .padding()
        
        Spacer()
        
        VStack{
          Text(pokemon.name)
            .font(.largeTitle)
            .bold()
            .foregroundColor(.yellow)
          Text(pokemon.type)
            .bold()
        }
        Spacer()
      }.frame(width: UIScreen.main.bounds.width,  alignment: .center)
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
      PokemonView(pokemon: pikachu)
    }
}
