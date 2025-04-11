//
//  MemorizeGame.swift    // This is the model
//  Stanford CS193
//
//  Created by RyanA on 4/8/25.
//

import Foundation         // This is the model

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
            
        }
    }
    
    func choose (_ card: Card) {
        
    }
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
    }
}

