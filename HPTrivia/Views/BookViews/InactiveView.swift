//
//  InactiveView.swift
//  HPTrivia
//
//  Created by John Newman on 4/11/2025.
//

import SwiftUI

struct InactiveView: View {
    
    @State var book: Book
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(book.image).resizable()
                .scaledToFit()
                .shadow(radius: 7)
                .overlay {
                    Rectangle().opacity(0.33)
                }
            
            Image(systemName: "circle")
                .font(.largeTitle)
                .imageScale(.large)
                .foregroundStyle(.green.opacity(0.5))
                .shadow(radius: 1)
                .padding(3)
        }
    }
}

#Preview {
    InactiveView(book: BookQuestions().books[0])
}
