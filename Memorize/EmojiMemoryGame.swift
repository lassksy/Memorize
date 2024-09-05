//
//  EmojiMemorizyGame.swift
//  Memorize
//
//  Created by Mac on 3/14/24.
//

import SwiftUI


class EmojiMemoryGame {
    private static let emojis = ["👻", "🦇","🕷️" ,"🦄" , "😈","😱","🥵" ,"😶‍🌫️", "😰" , "😥"]
    private var model = MemoryGame(
        numberOfPairsOfCards: 4 ) { pairIndex in
            return emojis[pairIndex]
        }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
