//
//  SheetMyPokemonView.swift
//  PhinconPoke
//
//  Created by Rarito on 11/02/23.
//

import SwiftUI

struct SheetMyPokemonView: View {
    
    @Environment(\.presentationMode) var presentation
    @StateObject var myVM = MyPokemonViewModel()
    @State var nickname = ""
    
    var body: some View {
        VStack(alignment: .trailing){
            Button(action: {
                presentation.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.blue)
                    .font(.title2)
                    .padding(20)
            })
            
            TextField("Add your nickname here..", text: $nickname)
                .background(Color.white)
                .padding(20)
                .font(.system(size: 18))
            
            Button(action: {
                guard !nickname.isEmpty else { return }
                saveToEntities(text: nickname)
                nickname = ""
                presentation.wrappedValue.dismiss()
            }, label: {
                Text("Add to my pokemon")
                    .foregroundColor(.blue)
                    .font(.headline)
                    .padding(20)
                    .background(Color.white.cornerRadius(12))
            })
        }
        .padding()
        .frame(height: 100, alignment: .bottom)
    }
    
    func saveToEntities(text: String) {
        myVM.addMyPokemon(text: text)
        myVM.saveData()
    }

}

struct SheetMyPokemonView_Previews: PreviewProvider {
    static var previews: some View {
        SheetMyPokemonView()
    }
}
