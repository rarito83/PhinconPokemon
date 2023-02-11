//
//  Pokemon.swift
//  PhinconPoke
//
//  Created by Rarito on 09/02/23.
//

import Foundation

struct PokemonResponse: Codable {
    let count: Int
    let next: String
    let results: [Pokemon]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.count = try container.decode(Int.self, forKey: .count)
        self.next = try container.decode(String.self, forKey: .next)
        self.results = try container.decode([Pokemon].self, forKey: .results)
    }
}

// MARK: - Pokemon
struct Pokemon: Codable, Identifiable, Equatable {
    let id = UUID()
    let name: String
    let url: String
    
    static var sample = Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
}

// MARK: - PokemonSelected
struct PokemonSelected : Codable {
    let sprites: PokemonSprites
    
    init(sprites: PokemonSprites) {
        self.sprites = sprites
    }
}

// MARK: - PokemonSprites
struct PokemonSprites : Codable {
    let front_default: String?
}


