//
//  PokemonViewModel.swift
//  PhinconPoke
//
//  Created by Rarito on 09/02/23.
//

import Foundation
import SwiftUI

class PokemonViewModel: ObservableObject {
    
    private let api = ApiService()
    @Published var pokemonList = [Pokemon]()
    @Published var pokemonDetails: DetailPokemon?
    @Published var searchText = ""
    @Published var pokemonImg = ""
    
    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokemonList : pokemonList.filter {
            $0.name.contains(searchText.lowercased())
        }
    }

    func getPokemon() {
        api.getPokemon() { data in
            DispatchQueue.main.async {
                self.pokemonList = data
            }
        }
    }
    
    func getPokemonIndex(pokemon: Pokemon) -> Int {
        if let index = self.pokemonList.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }
    
    func getImage(url: String) {
        var tempImg: String?
        api.getImagePokemon(url: url) { img in
            tempImg = img.front_default
            self.pokemonImg = tempImg ?? ""
        }
    }

    func getDetails(pokemon: Pokemon) {
        let id = getPokemonIndex(pokemon: pokemon)
        
        self.pokemonDetails = DetailPokemon(id: 0, height: 0, weight: 0, moves: [], types: [])
        
        api.getDetailPokemon(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetails = data
            }
        }
    }

    func formatHW(value: Int) -> String {
        let dValue = Double(value)
        let string = String(format: "%.2f", dValue / 10)
        return string
    }
}
