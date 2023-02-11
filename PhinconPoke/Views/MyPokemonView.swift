//
//  MyPokemonView.swift
//  PhinconPoke
//
//  Created by Rarito on 11/02/23.
//

import SwiftUI

struct MyPokemonView: View {
    
    @StateObject var myVM = MyPokemonViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(myVM.savedMyPoke) { entiti in
                        Text(entiti.name ?? "No Name")
                            .onTapGesture {
                                myVM.updateMyPokeData(entity: entiti)
                            }
                    }
                    .onDelete(perform: myVM.deleteData)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("My Pokemon")
        }
    }
}

struct MyPokemonView_Previews: PreviewProvider {
    static var previews: some View {
        MyPokemonView()
    }
}
