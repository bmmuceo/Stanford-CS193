//
//  EmojiMemoryGameView.swift
//  Stanford CS193
//
//  Created by RyanA on 4/8/25.
//

import SwiftUI


struct EmojiMemoryGameView: View {
    var body: some View {
        MultipleCards (viewModel: EmojiMemoryGame.init())
    }
}


struct MultipleCards: View {
    
    var viewModel: EmojiMemoryGame = EmojiMemoryGame()
    
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns:  [GridItem(.adaptive(minimum: 75), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
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


struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            
            let rRect = RoundedRectangle(cornerRadius: 12)
            
            if card.isFaceUp {
                Group {
                    rRect
                        .foregroundStyle(Gradient(colors: [.nott,.wwww,.vibess,]))
                    rRect
                        .strokeBorder(.red,lineWidth: 3)
                        .shadow(color: .red, radius: 7)
                        .brightness(Float64(0.8))
                    Text(card.content)
                        .font(.system(size: 200))
                        .minimumScaleFactor(0.01)
                        .aspectRatio(1, contentMode: .fit)
                        .shadow(color: .green, radius: 0.8)
                        .brightness(0.3)
                }
            } else {
                rRect
                    .fill(.opacity(0.4))
                    .strokeBorder(lineWidth: 5)
                    .shadow(color: .white, radius: 8)
                Text("⛄︎")
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode:.fit)
                    .brightness(0.9)
                    .shadow(color: .pink, radius: 5.0)
                
            }
        }
    }
}



#Preview {
    EmojiMemoryGameView()
        .preferredColorScheme(.dark)
}

