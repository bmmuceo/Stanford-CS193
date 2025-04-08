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
    let emojis: [String] = ["🐻","🐼","🐨","🐶","🐷","🐸","🐹","🐺","🐻‍❄️"]
    @State var cardCount: Int = 4
    
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<cardCount, id: \.self) { index in
                    cardView(content: emojis [index])
                }
            }
            .padding()
            .foregroundStyle(Gradient(colors: [.vibess,.wwww,.nott,.wwww,.vibess,.nott,.wwww,.nott,.wwww]))
           
            
            HStack {
                Spacer()
                Button(action: {
                    if cardCount > 1 {
                        cardCount -= 1
                    }
                }, label: {
                    Image(systemName: "minus.square")
                })
                
                Spacer()
                Button(action: {
                    if cardCount < emojis.count {
                        cardCount += 1
                    }
                }, label: {
                    Image(systemName: "plus.square")
                })
                Spacer()
            }
            .font(.largeTitle.bold())
            .blendMode(.hardLight)
            .foregroundStyle(Gradient(colors: [.nott,.wwww,.vibess,]))
            .padding()
            
        }
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
                    .foregroundStyle(Gradient(colors: [.nott,.wwww,.vibess,]))
                    
                rRect
                    .strokeBorder(.red,lineWidth: 3)
                    .shadow(color: .red, radius: 7)
                    .brightness(Float64(0.8))
                Text(content)
                    .font(.largeTitle)
                    .shadow(color: .yellow, radius: 8)
                    .brightness(0.2)
                
                
                
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

