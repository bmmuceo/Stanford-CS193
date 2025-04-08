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

struct cardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(lineWidth: 2)
                .shadow(color: .yellow, radius: 9.9)
                .foregroundColor(.red)
            Text("🐺")
                .font(.largeTitle)
        }
        .foregroundStyle(.black)
    }
}
struct multipleCards: View {
    var body: some View {
        HStack {
            cardView()
            cardView()
            cardView()
            cardView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

