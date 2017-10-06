//
//  AsynchronousThingTests.swift
//  UnitTestingExamplesTests
//
//  Created by Scotty on 04/10/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import XCTest
import UnitTestingExamples

class AsynchronousThingTests: XCTestCase {
    
    func testAsyncAdd() {
        
        let testExpectation = expectation(description: #function)
        
        let asyncThing = AsynchronousThing()
        
        asyncThing.asyncAdd(lhs: 7, rhs: 10) { result in
            XCTAssertEqual(result, 17)
            testExpectation.fulfill()
        }
        
        wait(for: [testExpectation], timeout: 1)
    }
    
}
