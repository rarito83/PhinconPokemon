//
//  PokemonDetailView.swift
//  PhinconPoke
//
//  Created by Rarito on 09/02/23.
//

import SwiftUI

struct PokemonDetailView: View {
    
    @EnvironmentObject var pokemonVM: PokemonViewModel
    @State var pokemon: Pokemon
    @State var title = "title"
    @State var isCatched: Bool = false
    @State var backgroundColor = Color.white
    
    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            VStack {
                PokemonCard(pokemon: pokemon)
                VStack(spacing: 20) {
                    Text("**ID** : \(pokemonVM.pokemonDetails?.id ?? 0)")
                    Text("**Weight**: \(pokemonVM.formatHW(value: pokemonVM.pokemonDetails?.weight ?? 0)) KG")
                    Text("**Height**: \(pokemonVM.formatHW(value: pokemonVM.pokemonDetails?.height ?? 0)) M")
//                    Text("**Type**:\(pokemonVM.pokemonDetails?.types ?? [TypeElement])")
                    
                    Spacer(minLength: 20)
                    Button(action: {
                        self.title = "CATCHED POKE"
                        isCatched = catchedPokemon()
                    }, label: {
                        Text("catch".uppercased())
                            .padding(.horizontal)
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding()
                            .background(
                                Color.blue
                                    .cornerRadius(12)
                                    .shadow(radius: 12)
                            )
                    })
                    .sheet(isPresented: $isCatched, content:{
                        SheetMyPokemonView()
                    })
                }
                .padding()
            }
            .onAppear {
                pokemonVM.getDetails(pokemon: pokemon)
            }
        }
    }
    
    func catchedPokemon() -> Bool {
        if Bool.random() == self.isCatched {
            backgroundColor = .green
            print("Pokemon \(pokemon.name) is catched")
            return true
        } else {
            print("Pokemon \(pokemon.name) not catched")
            return false
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Pokemon.sample)
            .environmentObject(PokemonViewModel())
    }
}
