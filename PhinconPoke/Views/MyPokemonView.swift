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
            VStack(spacing: 20) {
                List {
                    ForEach(myVM.savedMyPoke) { entiti in
                        Text(entiti.name ?? "No Name")
                    }
                }
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
