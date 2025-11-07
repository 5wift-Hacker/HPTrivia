//
//  ContentView.swift
//  HPTrivia
//
//  Created by John Newman on 1/11/2025.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State private var animateViewsIn = false
    
    @State private var audioPlayer: AVAudioPlayer!
    @State private var showSettings = false
    @State private var playGame = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                Image("starrysky")
                    .resizable().frame(width: geo.size.width * 4, height: geo.size.height)
                    .overlay {
                        LinearGradient(colors: [.clear, .black, .black], startPoint: .top, endPoint: .bottom)
                            .frame(height: 400)
                            .offset(y: -50)
                    }
                    .phaseAnimator([false, true]) { content, phase in
                        content
                            .offset(x: phase ? geo.size.width / 1.1 : -geo.size.width / 1.1)
                    } animation: { _ in
                            .linear(duration: 45)
                    }
                
                AnimatedBackground(geo: geo)
                
                VStack {
                    
                    GameTitle(animateViewsIn: $animateViewsIn)
                    
                    Spacer()
                    
                    RecentScores(animateViewsIn: $animateViewsIn)
                    
                    Spacer()
                    
                    ButtonBar(geo: geo, animateViewsIn: $animateViewsIn, playGame: $playGame)
                    
                    Spacer()
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
        .onAppear {
            animateViewsIn = true
            playAudio()
        }
        .fullScreenCover(isPresented: $playGame) {
            Gameplay()
                .onAppear {
                    audioPlayer.setVolume(0, fadeDuration: 3)
                }
                .onDisappear {
                    audioPlayer.setVolume(1, fadeDuration: 3)
                }
        }
    }
    
    private func playAudio() {
        let sound = Bundle.main.path(forResource: "magic-in-the-air", ofType: "mp3")
        audioPlayer = try! AVAudioPlayer(contentsOf: URL(filePath: sound!))
        audioPlayer.numberOfLoops = -1 // infinity
        audioPlayer.play()
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
        .environment(Game())
}
