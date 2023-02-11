//
//  MyPokemonViewModel.swift
//  PhinconPoke
//
//  Created by Rarito on 11/02/23.
//

import Foundation
import CoreData

class MyPokemonViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedMyPoke: [MyPokemonEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "MyPokemon")
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Error Load Data \(error.localizedDescription)")
            } else {
                print("Successfully Load Data")
            }
        }
        
        fetchMyPokemon()
    }
    
    func fetchMyPokemon() {
        let request = NSFetchRequest<MyPokemonEntity>(entityName: "MyPokemonEntity")
        
        do {
            savedMyPoke = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching... \(error)")
        }
    }
    
    func addMyPokemon(text: String) {
        let newMyPokemon = MyPokemonEntity(context: container.viewContext)
        newMyPokemon.name = text
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchMyPokemon()
        } catch let error {
            print("Error save data... \(error)")
        }
    }
}
