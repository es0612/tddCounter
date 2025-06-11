//
//  TddCounterTests.swift
//  TddCounterTests
//  
//  Created on 2025/06/11
//


import Testing
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

}
