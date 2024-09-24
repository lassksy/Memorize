//
//  EmojiMemorizyGame.swift
//  Memorize
//
//  Created by Mac on 3/14/24.
//

import SwiftUI


class EmojiMemoryGame : ObservableObject {
    private static let emojis = ["👻", "🦇","🕷️" ,"🦄" , "😈","😱","🥵" ,"😶‍🌫️", "😰" , "😥"]
    typealias Card = MemoryGame<String>.Card
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(
            numberOfPairsOfCards: 2 ) { pairIndex in
                if emojis.indices.contains(pairIndex) {
                    return emojis[pairIndex]
                } else {
                    return "‼️"
                }
            }
    }
        
    @Published private var model = createMemoryGame()
        
        var cards: Array<Card> {
            model.cards
        }
    
    var color: Color {
        .blue
    }
    
    //MARK: -Intents
    func shuffle() {
        model.shuffle()

    }
        
        func choose(_ card: Card) {
            model.choose(card)
        }
    }

