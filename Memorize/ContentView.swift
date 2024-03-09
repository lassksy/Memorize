//
//  ContentView.swift
//  Memorize
//
//  Created by Mac on 3/9/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "🦇","🕷️" ,"🦄" , "😈","😱","🥵" ,"😶‍🌫️", "😰" , "😥"]
    @State var cardCount: Int = 4
    var body: some View {
        ScrollView {
            card
        }
        
        
        cardCountAdjuster
    }
    
    
    var card: some View {
        LazyVGrid(columns:[GridItem(.adaptive(minimum: 120))]) {
            ForEach( 0..<cardCount, id:\.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(1 , contentMode: .fit)
                    .foregroundColor(.blue)
                    .padding()
                
            }
        }
        
    }
    var cardCountAdjuster: some View {
        HStack {
            cardAdder
            cardRemover
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int ,symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount +  offset < 0 || cardCount + offset > emojis.count)
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.fill.badge.plus")
        
    }
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
        
        
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
 
