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
    var viewModel: EmojiMemoryGame
    let emojis: [String] = ["🐻","🐼","🐨","🐶","🐷","🐸","🐹","🐺","🐻‍❄️","🐴","🐮","🐭"]
                                        // @State var cardCount: Int = 4
    
    var body: some View {
                                        // VStack {
        ScrollView {
            cardTiles
                                        // }
                                        // cardCountAdjusters
        }
        .padding()
    }
    
    
    
    var cardTiles: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(emojis.indices, id: \.self) { index in
                cardView(content: emojis [index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .padding()
        .foregroundStyle(Gradient(colors: [.vibess,.wwww,.nott,.wwww,.vibess,.nott,.wwww,.nott,.wwww]))
    }
}
/* var cardCountAdjusters: some View {
 HStack {
 Spacer()
 cardRemover
 Spacer()
 cardAdder
 Spacer()
 }
 .font(.largeTitle.bold())
 .imageScale(.large)
 .blendMode(.hardLight)
 .foregroundStyle(Gradient(colors: [.vibess,.nott,.wwww,.vibess,]))
 }
 
 func cardCountAdjuster(by offset: Int,symbol : String) -> some View {
 Button(action: {
 cardCount += offset
 }, label: {
 Image(systemName: symbol)
 })
 .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
 }
 
 var cardRemover: some View {
 cardCountAdjuster(by: -1, symbol: "minus.square")
 }
 var cardAdder: some View {
 cardCountAdjuster(by: +1, symbol: "plus.square")
 
 }
 }*/


struct cardView: View {
    let content: String
    @State var isFlipped: Bool = false
    
    var body: some View {
        ZStack {
            let rRect = RoundedRectangle(cornerRadius: 12)
            
            if isFlipped {
                rRect
                    .foregroundStyle(Gradient(colors: [.nott,.wwww,.vibess,]))
                rRect
                    .strokeBorder(.red,lineWidth: 3)
                    .shadow(color: .red, radius: 7)
                    .brightness(Float64(0.8))
                Text(content)
                    .frame(alignment: .center)
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
                    .frame(alignment: .center)
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

