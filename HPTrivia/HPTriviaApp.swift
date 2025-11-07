//
//  HPTriviaApp.swift
//  HPTrivia
//
//  Created by John Newman on 1/11/2025.
//

import SwiftUI

@main
struct HPTriviaApp: App {
    
    private var game = Game()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(game)
        }
    }
}



/** 🟪 - started | 🟨 - almost done | 🟩 - complete
 App Dev Plan
 🟩 game intro screen
 🟩 gameplay screen
 🟩 game logic (questions, scores, etc)
 🟩 celebration if right answer
 🟩 audio / background music
 🟩 animations
 🟩 in-app purchases
 🟩 store
 🟩 instruction screen / how to play game
 🟩 books
 🟩 persist scores
 */
