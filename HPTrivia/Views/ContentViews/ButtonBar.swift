//
//  ButtonBar.swift
//  HPTrivia
//
//  Created by John Newman on 2/11/2025.
//

import SwiftUI

struct ButtonBar: View {
    
    let geo: GeometryProxy
    @Binding var animateViewsIn: Bool
    @Binding var playGame: Bool
    
    var body: some View {
        HStack {
            
            Spacer()
            
            //instruction button container vstack
            InstructionsButton(geo: geo, animateViewsIn: $animateViewsIn)
            
            Spacer()
            
            PlayButton(geo: geo, animateViewsIn: $animateViewsIn, playGame: $playGame)
            
            Spacer()
            
            SettingsButton(geo: geo, animateViewsIn: $animateViewsIn)
            
            Spacer()
        }
        //reduces frame size to size of screen
        .frame(width: geo.size.width)
    }
}

#Preview {
    GeometryReader { geo in
        ButtonBar(geo: geo, animateViewsIn: .constant(true), playGame: .constant(false))
    }
}
