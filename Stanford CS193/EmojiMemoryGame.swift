//
//  EmojiMemoryGame.swift
//  Stanford CS193
//
//  Created by RyanA on 4/8/25.
//

import SwiftUI



class EmojiMemoryGame {                          // Class is the view model & Memorizegame.swift is the View model
   private var model: MemoryGame<String> {
        didSet {
            print("\(model)")
        }
    }
}

