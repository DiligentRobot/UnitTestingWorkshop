//
//  PersonIdTests.swift
//  ViewModelExampleTests
//
//  Created by Scotty on 06/10/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import XCTest
@testable import ViewModelExample

class PersonIdTests: XCTestCase {
    
    func testPersonIdValue() {
        let testValue = "Test Value"
        let personId = PersonId(id: testValue)
        XCTAssertEqual(personId.value, testValue)
    }
    
    func testPersonIdEquality() {
        let testValue = "Test Value"
        
        let personId1 = PersonId(id: testValue)
        let personId2 = PersonId(id: testValue)
        
        XCTAssertEqual(personId1, personId2)
    }
    
    func testPersonIdInequality() {
        let testValue = "Test Value"
        let testValue2 = " Test Value 2"
        
        let personId1 = PersonId(id: testValue)
        let personId2 = PersonId(id: testValue2)
        
        XCTAssertNotEqual(personId1, personId2)
    }
}
