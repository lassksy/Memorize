//
//  ContentView.swift
//  Memorize
//
//  Created by Mac on 3/9/24.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    let emojis = ["👻", "🦇","🕷️" ,"🦄" , "😈","😱","🥵" ,"😶‍🌫️", "😰" , "😥"]
    var body: some View {
        ScrollView {
            card
        }
    }
     
    
    var card: some View {
        LazyVGrid(columns:[GridItem(.adaptive(minimum: 120))]) {
            ForEach(emojis.indices, id:\.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(1 , contentMode: .fit)
                    .foregroundColor(.blue)
                    .padding()
                
            }
        }
        
    }

    

     
    struct CardView: View {
        let content: String
        @State var isFaceUp: Bool = true
        var body: some View {
            ZStack {
                let base: RoundedRectangle =  RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                Group {
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 5)
                    Text(content).font(.largeTitle)
                }
                .opacity(isFaceUp ? 1 : 0)
                base.fill().opacity(isFaceUp ? 0 : 1)
                }
            .onTapGesture {
                isFaceUp.toggle()
            
            }
            }
        }
    }

#Preview {
    ContentView()
}
 
