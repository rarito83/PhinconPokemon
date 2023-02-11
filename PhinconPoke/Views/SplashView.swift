//
//  Splash.swift
//  PhinconPoke
//
//  Created by Rarito on 09/02/23.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isActive = false
    @State private var size = 0.4
    @State private var opacity = 0.5

    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                VStack {
                    Image("pokemon")
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                        .padding(28)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 2.0)) {
                        self.size = 1.0
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
