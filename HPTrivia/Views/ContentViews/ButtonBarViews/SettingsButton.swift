//
//  SettingsButton.swift
//  HPTrivia
//
//  Created by John Newman on 2/11/2025.
//

import SwiftUI

struct SettingsButton: View {
    
    let geo: GeometryProxy
    @Binding var animateViewsIn: Bool
    @State private var showSettings = false
    
    var body: some View {
        VStack {
            if animateViewsIn {
                Button {
                    showSettings.toggle()
                } label: {
                    Image(systemName: "gearshape.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .shadow(radius: 5)
                }
                .transition(.offset(x: geo.size.width / 4))
            }
        }
        .animation(.easeOut(duration: 0.7).delay(2.7), value: animateViewsIn)
        .sheet(isPresented: $showSettings) {
            SelectBooks()
        }
    }
}

#Preview {
    GeometryReader { geo in
        SettingsButton(geo: geo, animateViewsIn: .constant(true))
            .environment(Game())
    }
}
