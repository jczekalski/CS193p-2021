//
//  ContentView.swift
//  Memorize
//
//  Created by JC on 31/10/2022.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["💻","🐢","✈️","🦀", "🦄", "🦇"]
    @State var emojiCount = 4
    
    var body: some View {
        VStack {
            HStack {
                ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                    CardView(content: emoji)
                }
            }
            Spacer()
            HStack {
                removeCard
                Spacer()
                addCard
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
    
    var removeCard: some View {
        Button {
                if emojiCount > 1 {
                    emojiCount -= 1
                }
            } label: {
                Image(systemName: "minus.circle")
            }
    }
    
    var addCard: some View {
        Button {
                if emojiCount < emojis.count {
                    emojiCount += 1
                }
            }
            label: {
                Image(systemName: "plus.circle")
            }
    }
    
    
}


struct CardView: View {
    var content: String = "✈️"
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if (isFaceUp) {
                shape.fill(.white)
                shape.stroke(lineWidth: 3).fill(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
                Text(content).font(.largeTitle)
            } else {
                shape.fill(.red)
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
            ContentView()
                .preferredColorScheme(.dark)
                
        }
    }
}
