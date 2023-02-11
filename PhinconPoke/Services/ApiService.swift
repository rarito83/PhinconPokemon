//
//  ApiService.swift
//  PhinconPoke
//
//  Created by Rarito on 09/02/23.
//

import Foundation

class ApiService: ObservableObject {
    
    func getPokemon(completion: @escaping ([Pokemon]) -> ()) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=100") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let pokeList = try JSONDecoder().decode(PokemonResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(pokeList.results)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getImagePokemon(url: String, completion:@escaping (PokemonSprites) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let pokemonImage = try JSONDecoder().decode(PokemonSelected.self, from: data)
                
                DispatchQueue.main.async {
                    completion(pokemonImage.sprites)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getDetailPokemon(id: Int, completion:@escaping (DetailPokemon) -> ()) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)/") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let pokeDetail = try JSONDecoder().decode(DetailPokemon.self, from: data)
                DispatchQueue.main.async {
                    completion(pokeDetail)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
