//
//  PokemonCard.swift
//  PhinconPoke
//
//  Created by Rarito on 09/02/23.
//

import SwiftUI

struct PokemonCard: View {

    @EnvironmentObject var pokemonVM: PokemonViewModel
    var imageLink = ""
    let pokemon: Pokemon
    
    var body: some View {
        ZStack {
            VStack {
                AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemonVM.getPokemonIndex(pokemon: pokemon)).png")) { image in
                    if let image = image {
                        image
                            .image?.resizable()
                            .padding()
                            .frame(width: 160, height: 160)
                            .background(Color.gray)
                            .scaledToFit()
                            .cornerRadius(12)
                            .shadow(radius: 12)
                    }
                }

                Text("\(pokemon.name.capitalized)")
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                    .padding(.horizontal, 10)
                    .frame(width: 160, height: 40)
                    .border(Color.gray)
                    .onAppear {
                        let loadedData = UserDefaults.standard.string(forKey: imageLink)

                        if loadedData == nil {
                            pokemonVM.getImage(url: imageLink)
                            UserDefaults.standard.set(imageLink, forKey: imageLink)
                        } else {
                            pokemonVM.getImage(url: loadedData ?? "")
                        }
                    }
                    .cornerRadius(12)
                    .foregroundColor(Color.gray.opacity(0.60))
                    .scaledToFit()
            }
        }
        .frame(width: 200, height: 240, alignment: .center)
        .cornerRadius(14)
        .aspectRatio(12, contentMode: .fit)
    }
}

struct PokemonCard_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCard(pokemon: Pokemon.sample)
            .environmentObject(PokemonViewModel())
    }
}
