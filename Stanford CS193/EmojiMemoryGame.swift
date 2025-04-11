//
//  EmojiMemoryGame.swift
//  Stanford CS193
//
//  Created by RyanA on 4/8/25.
//


import SwiftUI



class EmojiMemoryGame {
    private static let emojis = ["🐻","🐼","🐨","🐶","🐷","🐸","🐻","🐼","🐨","🐶","🐷","🐸"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 12) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "Opps!💩"
            }
        }
    }
    
    private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}


