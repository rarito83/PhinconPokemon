//
//  ContentView.swift
//  PhinconPoke
//
//  Created by Rarito on 09/02/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var pokemonVM = PokemonViewModel()
    @State private var showAccount = false
    @State private var numberOfColumns = 2
    let spacing: CGFloat = 0
    
    var body: some View {
        
        let columns = Array(repeating: GridItem(.flexible(), spacing: spacing), count: numberOfColumns)
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(pokemonVM.filteredPokemon) { data in
                        NavigationLink(destination: PokemonDetailView(pokemon: data)
                        ) {
                            PokemonCard(pokemon: data)
                        }
                    }
                }
                .padding(.all, 10)
            }
            .onAppear {
                pokemonVM.getPokemon()
            }
            .searchable(text: $pokemonVM.searchText)
            .padding(5)
            .navigationTitle("Pokemon")
            .navigationBarItems(trailing:
                HStack {
                    NavigationLink(destination: MyPokemonView()) {
                        Image(systemName: "person.circle")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 25, height: 25)
                    }
                })
        }
        .environmentObject(pokemonVM)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
