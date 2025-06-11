//
//  ContentView.swift
//  TddCounter
//  
//  Created on 2025/06/11
//


import SwiftUI

struct ContentView: View {
    @ObservedObject var counter: Counter
    
    init(counter: Counter = Counter()) {
        self.counter = counter
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Text("カウンター")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("\(counter.value)")
                .font(.system(size: 72, weight: .bold, design: .monospaced))
                .foregroundColor(.primary)
            
            HStack(spacing: 30) {
                Button(action: {
                    counter.decrement()
                }) {
                    Image(systemName: "minus.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.red)
                }
                
                Button(action: {
                    counter.increment()
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.blue)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
