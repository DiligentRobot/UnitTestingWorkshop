//
//  BasicThingTests.swift
//  UnitTestingExamplesTests
//
//  Created by Scotty on 04/10/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import XCTest
import UnitTestingExamples


class BasicThingTests: XCTestCase {
    
    var basicThing = BasicThing()
    
    func testAddWithPositiveNumbers() {
        let result = basicThing.add(lhs: 7, rhs: 19)
        XCTAssertEqual(result, 26)
    }
    
    func testAddWithNegativeNumbers() {
        let result = basicThing.add(lhs: -7, rhs: -19)
        XCTAssertEqual(result, -26)
    }
    
    func testAddWithNegativeAndPositiveNumbers() {
        let result = basicThing.add(lhs: 7, rhs: -19)
        XCTAssertEqual(result, -12)
    }
}
