//
//  EmojiMemoryGameView.swift
//  Stanford CS193
//
//  Created by RyanA on 4/8/25.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var body: some View {
        MultipleCards(viewModel: EmojiMemoryGame())
    }
}

struct MultipleCards: View {

    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
        VStack {
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }

    var cards: some View {
        LazyVGrid(
            columns: [GridItem(.adaptive(minimum: 75), spacing: 0)],
            spacing: 0
        ) {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2 / 3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }

            }
        }
        .padding()
        .foregroundStyle(
            Gradient(colors: [
                .vibess, .wwww, .nott, .wwww, .vibess, .nott, .wwww, .nott,
                .wwww,
            ])
        )
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card

    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }

    var body: some View {

        ZStack {
            let rRect = RoundedRectangle(cornerRadius: 12)

            if card.isFaceUp {
                rRect
                rRect
                    .strokeBorder(.red, lineWidth: 3)
                    .shadow(color: .red, radius: 7)
                    .brightness(Float64(0.8))
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
                    .shadow(color: .green, radius: 0.8)
                    .brightness(0.3)
            } else if card.isMatched {
                rRect
                    .opacity(0)

            } else {
                rRect
                    .fill(.opacity(0.5))
                    .strokeBorder(lineWidth: 5)
                    .shadow(color: .white, radius: 8)
                Text("⛄︎")
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
                    .shadow(color: .pink, radius: 5.0)
                    .brightness(1.4)
            }
        }
    }
}

#Preview {
    EmojiMemoryGameView()
        .preferredColorScheme(.dark)
}
