//
//  BasicThingWithStateTests.swift
//  UnitTestingExamplesTests
//
//  Created by Scotty on 04/10/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import XCTest
import UnitTestingExamples

class BasicThingWithStateTests: XCTestCase {
    
    func testInitWithPositiveValue() {
        let basicThing = BasicThingWithState(value: 7)
        XCTAssertEqual(basicThing.value, 7)
    }
    
    func testInitWithNegativeValue() {
        let basicThing = BasicThingWithState(value: -7)
        XCTAssertEqual(basicThing.value, -7)
    }
    
    func testInitWithZeroValue() {
        let basicThing = BasicThingWithState(value: 0)
        XCTAssertEqual(basicThing.value, 0)
    }
    
    func testAddWithPositiveNumbers() {
        let basicThing = BasicThingWithState(value: 7)
        basicThing.add(19)
        XCTAssertEqual(basicThing.value, 26)
    }
    
    func testAddWithNegativeNumbers() {
        let basicThing = BasicThingWithState(value: 7)
        basicThing.add(-19)
        XCTAssertEqual(basicThing.value, -12)
    }
    
    func testAddWithZero() {
        let basicThing = BasicThingWithState(value: 7)
        basicThing.add(0)
        XCTAssertEqual(basicThing.value, 7)
    }
}
