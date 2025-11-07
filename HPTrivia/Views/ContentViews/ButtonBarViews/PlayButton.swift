//
//  PlayButton.swift
//  HPTrivia
//
//  Created by John Newman on 2/11/2025.
//

import SwiftUI

struct PlayButton: View {
    let geo: GeometryProxy
    @Binding var animateViewsIn: Bool
    @Binding var playGame: Bool
    @State private var scalePlayButton = false
    
    var body: some View {
        VStack { //anim surrounding group
            if animateViewsIn {
                Button {
                    playGame.toggle()
                } label: {
                    Text("Play")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 50)
                        .background(.brown)
                        .clipShape(.capsule)
                        .shadow(radius: 5)
                        .scaleEffect(scalePlayButton ? 1.2 : 1)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 1.3).repeatForever()) {
                                scalePlayButton.toggle()
                            }
                        }
                }
                .transition(.offset(y: geo.size.height / 3))
            }
        }
        .animation(.easeOut(duration: 0.7).delay(2), value: animateViewsIn)
    }
}

#Preview {
    GeometryReader { geo in
        PlayButton(geo: geo, animateViewsIn: .constant(true), playGame: .constant(false))
    }
}
