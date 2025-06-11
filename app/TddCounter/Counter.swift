//
//  Counter.swift
//  TddCounter
//  
//  Created on 2025/06/11
//


import Foundation

class Counter: ObservableObject {
    @Published var value: Int = 0
    
    func increment() {
        value += 1
    }
    
    func decrement() {
        value -= 1
    }
}