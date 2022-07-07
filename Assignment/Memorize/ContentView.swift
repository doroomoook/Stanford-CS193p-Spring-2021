//
//  ContentView.swift
//  Memorize
//
//  Created by 김태성 on 2022/07/06.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐽", "🐸", "🐵", "🙈", "🙉", "🙊", "🐒", "🐔", "🐧", "🐦"]
    
    @State var emojiCount = 14
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self, content: { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    })
                }
            }
            .foregroundColor(.orange)
            Spacer()
            HStack {
                Spacer()
                theme1
                Spacer()
                theme2
                Spacer()
                theme3
                Spacer()
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var theme1: some View {
        Button {
            emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "✈️", "🚀", "🛸", "⛵️", "🚖"]
            emojiCount = 16
            emojis.shuffle()
        } label: {
            VStack {
                Image(systemName: "car")
                Text("Vehicles")
                    .font(.caption)
            }
        }
    }
    
    var theme2: some View {
        Button {
            emojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐽", "🐸", "🐵", "🙈", "🙉", "🙊", "🐒", "🐔", "🐧", "🐦"]
            emojiCount = 20
            emojis = emojis.shuffled()
        } label: {
            VStack {
                Image(systemName: "pawprint")
                Text("Animals")
                    .font(.caption)
            }
        }
    }
    
    var theme3: some View {
        Button {
            emojis = ["🇿🇦", "🇰🇷", "🇹🇼", "🇳🇴", "🇳🇿", "🇳🇪", "🇩🇰", "🇱🇸", "🇱🇷", "🇧🇩", "🇻🇳", "🇱🇰", "🇸🇴", "🇰🇳", "🇮🇸", "🇯🇵", "🇨🇳", "🇯🇲", "🇨🇮"]
            emojiCount = 14
            emojis.shuffle()
        } label: {
            VStack {
                Image(systemName: "globe")
                Text("Country")
                    .font(.caption)
            }
        }
    }
    
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
//            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
        
    }
}
