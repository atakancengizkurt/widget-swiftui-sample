//
//  SpecialImageView.swift
//  PokemonWidget
//
//  Created by Atakan Cengiz KURT on 15.05.2021.
//

import SwiftUI

struct SpecialImageView: View {
  var image:Image
    var body: some View {
       image
        .resizable()
        .aspectRatio(contentMode: .fit)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.yellow, lineWidth: 8))
        .shadow(radius: 12)
      
    }
}

struct SpecialImageView_Previews: PreviewProvider {
    static var previews: some View {
      SpecialImageView(image: Image("pikachu")).previewLayout(.sizeThatFits)
    }
}
