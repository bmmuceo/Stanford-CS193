//
//  ContentView.swift
//  Stanford CS193
//
//  Created by RyanA on 4/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        multipleCards()
    }
}


struct multipleCards: View {
    let emojis: [String] = ["🐻","🐼","🐨","🐶","🐷","🐸","🐹"]
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                cardView(content: emojis[index])
            }
            
            
        }
        // perculates down
        .padding()
        .foregroundColor(.red)
    }
}

struct cardView: View {
    let content: String
    @State var isFlipped: Bool = true
    
    var body: some View {
        ZStack {
            let rRect = RoundedRectangle(cornerRadius: 12)
            // local var
            
            if isFlipped {
                rRect
                    .foregroundStyle(.red)
                rRect
                    .strokeBorder(.red,lineWidth: 5)
                    .shadow(color: .red, radius: 5)
                    .brightness(Float64(0.9))
                Text(content)
                    .font(.largeTitle)
                    .shadow(color: .white, radius: 2)
                    .brightness(0.1)
                
                
                
            } else {
                rRect
                    .fill(.regularMaterial.opacity(0.9))
                    .strokeBorder(lineWidth: 5)
                    .shadow(color: .white, radius: 2)
                Text("⛄︎")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .shadow(color: .red, radius: 4.0)
            }
        }
        .onTapGesture {
            isFlipped.toggle()
            
        }
    }
}

#Preview {
    ContentView()
}

