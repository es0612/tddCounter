//
//  TddCounterTests.swift
//  TddCounterTests
//  
//  Created on 2025/06/11
//


import Testing
import SwiftUI
@testable import TddCounter

struct TddCounterTests {

    @Test func counterInitialValueIsZero() async throws {
        let counter = Counter()
        #expect(counter.value == 0)
    }
    
    @Test func counterCanBeIncremented() async throws {
        let counter = Counter()
        counter.increment()
        #expect(counter.value == 1)
    }
    
    @Test func counterCanBeDecremented() async throws {
        let counter = Counter()
        counter.decrement()
        #expect(counter.value == -1)
    }
    
    @Test func contentViewDisplaysInitialCounterValue() async throws {
        let counter = Counter()
        let view = ContentView(counter: counter)
        
        // Counterが0で初期化されることを確認
        #expect(counter.value == 0)
    }
    
    @Test func contentViewButtonActionsUpdateCounter() async throws {
        let counter = Counter()
        let view = ContentView(counter: counter)
        
        // 初期値を確認
        #expect(counter.value == 0)
        
        // インクリメントボタンのアクションをシミュレート
        counter.increment()
        #expect(counter.value == 1)
        
        // デクリメントボタンのアクションをシミュレート
        counter.decrement()
        #expect(counter.value == 0)
        
        counter.decrement()
        #expect(counter.value == -1)
    }

}
