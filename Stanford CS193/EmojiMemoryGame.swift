//
//  EmojiMemoryGame.swift
//  Stanford CS193
//
//  Created by RyanA on 4/8/25.
//

// Class is the view model & Memorygame.swift is the View model

import SwiftUI

func createCardContent(forPairAtIndex index: Int) -> String {
    return["🐻","🐼","🐨","🐶","🐷","🐸","🐹","🐺","🐻‍❄️","🐴","🐮","🐭"][index]
}

class EmojiMemoryGame {
    
    private var model = MemoryGame(numberOfPairs: 4){ index in
            return ["🐻","🐼","🐨","🐶","🐷","🐸","🐹","🐺","🐻‍❄️","🐴","🐮","🐭"][index]
        }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

