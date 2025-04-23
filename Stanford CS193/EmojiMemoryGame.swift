//
//  EmojiMemoryGame.swift
//  Stanford CS193
//
//  Created by RyanA on 4/8/25.
//


import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = [
        "🐻", "🐼", "🐨", "🐶", "🐷", "🐸", "🐻", "🐼", "🐨", "🐶", "🐷", "🐸",
    ]

    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 12) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "Opps!💩"
            }
        }
    }

    @Published private var model = createMemoryGame()

    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }

    //MARK: - Intents
    func shuffle() {
        model.shuffle()

    }

    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }

}

//  EmojiMemoryGame.swift



