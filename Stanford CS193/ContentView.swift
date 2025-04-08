//
//  ContentView.swift
//  Stanford CS193
//
//  Created by RyanA on 4/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        multipleCards()
    }
}


struct multipleCards: View {
    var body: some View {
        HStack {
            cardView(isFlipped: true)
            cardView()
            cardView(isFlipped: true)
            cardView()
        }
        // perculates down
        .padding()
        .foregroundColor(.red)
    }
}

struct cardView: View {
    @State var isFlipped: Bool = false
    
    var body: some View {
        ZStack {
            let rRect = RoundedRectangle(cornerRadius: 12)
            let dog = Text("🐺")               // local var
            
            if isFlipped {
                rRect
                    .foregroundStyle(.red)
                rRect
                    .strokeBorder(.red,lineWidth: 5)
                    .shadow(color: .white, radius: 5)
                    .brightness(0.7)
                dog
                    .font(.largeTitle)
                    .shadow(color: .white, radius: 24)
                    .brightness(0.4)
                
                
            } else {
                rRect
                    .fill(.bar.opacity(0.97))
                    .strokeBorder(lineWidth: 5)
                    .shadow(color: .white, radius: 5)
                
            }
        }
        
        .onTapGesture {
            isFlipped.toggle()
            
        }
    }
}

#Preview {
    ContentView()
}

