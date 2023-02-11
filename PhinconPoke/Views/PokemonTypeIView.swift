//
//  PokemonTypeIView.swift
//  PhinconPoke
//
//  Created by Rarito on 10/02/23.
//

import SwiftUI

struct PokemonTypeIView: View {
    private var type: String
    init(type: String) {
        self.type = type
    }
    
    var body: some View {
        Text(type)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding([.leading, .trailing], 10)
            .padding(.bottom, 10)
            .background(
                Capsule()
                    .fill(Color.white)
                    .opacity(0.25)
                    .frame(height: 25).padding([.bottom], 10))
    }
}

struct PokemonTypeIView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonTypeIView(type: "")
    }
}
