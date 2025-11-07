//
//  InstructionsButton.swift
//  HPTrivia
//
//  Created by John Newman on 2/11/2025.
//

import SwiftUI

struct InstructionsButton: View {
    
    let geo: GeometryProxy
    @Binding var animateViewsIn: Bool
    @State private var showInstructions = false
    
    var body: some View {
        VStack {
            if animateViewsIn {
                Button {
                    showInstructions.toggle()
                } label: {
                    Image(systemName: "info.circle.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .shadow(radius: 5)
                }
                .transition(.offset(x: -geo.size.width / 4))
            }
        }
        .animation(.easeOut(duration: 0.7).delay(2.7), value: animateViewsIn)
        .sheet(isPresented: $showInstructions) {
            Instructions()
        }
    }
}

#Preview {
    GeometryReader { geo in
        InstructionsButton(geo: geo, animateViewsIn: .constant(true))
    }
}
