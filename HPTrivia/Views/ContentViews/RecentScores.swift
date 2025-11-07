//
//  RecentScores.swift
//  HPTrivia
//
//  Created by John Newman on 2/11/2025.
//

import SwiftUI

struct RecentScores: View {
    
    @Environment(Game.self) var game
    
    @Binding var animateViewsIn: Bool
    var body: some View {
        VStack {
            if animateViewsIn {
                VStack {
                    Text("Recent Scores")
                        .font(.title2)
                    
                    Text("\(game.recentScores[0])")
                    Text("\(game.recentScores[1])")
                    Text("\(game.recentScores[2])")
                }
                .font(.title3)
                .foregroundStyle(.white)
                .padding(.horizontal)
                .glassEffect(.clear.interactive(), in: .rect(cornerRadius: 10))
                .transition(.opacity)
            }
        }
        .animation(.linear(duration: 1).delay(4), value: animateViewsIn)
    }
}

#Preview {
    RecentScores(animateViewsIn: .constant(true))
        .environment(Game())
}
