//
//  MemorizeGame.swift
//  Stanford CS193
//
//  Created by RyanA on 4/8/25.
//

import Foundation                   // This is the model

struct MemoryGame<CardContent> {
   private(set) var cards: Array<Card>
    
    init(numberOfPairs: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairs {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))

        }
    }
    
    func choose (_ card: Card) {
     
    }
    
    struct Card {
        var isFaceUp = false
        var isMatched = false
       let  content: CardContent
    }
}

