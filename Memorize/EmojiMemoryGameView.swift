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
    private let specing: CGFloat = 4
    
    let emojis = ["👻", "🦇","🕷️" ,"🦄" , "😈","😱","🥵" ,"😶‍🌫️", "😰" , "😥"]
    var body: some View {
        VStack {
            
            card
                .foregroundColor(viewModel.color)
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
                .padding(specing)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
        
    }
}
    
    
    
    struct EmojiMemoryGameView_Previews: PreviewProvider {
        static var previews: some View {
            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
        }
    }
    

