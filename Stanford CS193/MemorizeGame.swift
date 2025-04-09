//
//  MemorizeGame.swift
//  Stanford CS193
//
//  Created by RyanA on 4/8/25.
//

import Foundation                   // This is the model

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose (card: Card) {
     
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var contentOnCard: CardContent
    }
}

