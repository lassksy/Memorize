//
//  ContentView.swift
//  Memorize
//
//  Created by Mac on 3/9/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    
    let emojis = ["👻", "🦇","🕷️" ,"🦄" , "😈","😱","🥵" ,"😶‍🌫️", "😰" , "😥"]
    var body: some View {
        VStack {
            
            card
                .animation(.default, value: viewModel.cards)
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    private var card: some View {
        AspectVGrid(items: viewModel.cards, aspectRatio  : aspectRatio) { card in
            CardView(card)
                .padding(4)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
        .foregroundColor(Color.blue)
        
    }
}
    
    
    
    
    
    
    struct CardView: View {
        let card: MemoryGame<String>.Card
        
        init(_ card: MemoryGame<String>.Card) {
            self.card = card
        }
        
        var body: some View {
            ZStack {
                let base: RoundedRectangle =  RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                Group {
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 5)
                    Text(card.content)
                        .font(.system(size: 200))
                        .minimumScaleFactor(0.01)
                        .aspectRatio( 1, contentMode: .fit)
                }
                .opacity(card.isFaceUp ? 1 : 0)
                base.fill()
                    .opacity(card.isFaceUp ? 0 : 1)
            }
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
        }
    }
    
    
    struct EmojiMemoryGameView_Previews: PreviewProvider {
        static var previews: some View {
            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
        }
    }
    

