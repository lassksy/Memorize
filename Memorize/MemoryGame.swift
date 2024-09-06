//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Mac on 3/14/24.
//

import Foundation


struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int , cardContentFactory: (Int) -> CardContent) {
        cards = []
        // 添加 numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2 , numberOfPairsOfCards) {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))

        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    mutating func shuffle() {
        cards.shuffle()

    }
    
    struct Card {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
    }
}
