//
//  ContentView.swift
//  Memorize
//
//  Created by Mac on 3/9/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    let emojis = ["👻", "🦇","🕷️" ,"🦄" , "😈","😱","🥵" ,"😶‍🌫️", "😰" , "😥"]
    var body: some View {
        VStack {
            ScrollView {
                card
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
     
    
    var card: some View {
        LazyVGrid(columns:[GridItem(.adaptive(minimum: 85), spacing: 0)] , spacing: 0) {
            ForEach(viewModel.cards.indices, id:\.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3 , contentMode: .fit)
                    .foregroundColor(Color.blue)
                    .padding(4)
                
            }
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
          
            }
        }
    }


struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
 
