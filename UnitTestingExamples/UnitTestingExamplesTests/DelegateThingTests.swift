//
//  DelegateThingTests.swift
//  UnitTestingExamplesTests
//
//  Created by Scotty on 06/10/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import XCTest
import UnitTestingExamples

class DelegateThingTests: XCTestCase {
    
    
    
    func testDelegateThingCallsDelegate() {
        
        class DelegateHandler: DelegateThingDelegate {
            func delegateMethod(string: String) {
                XCTAssertEqual(string, "Hello")
            }
        }
        
        let delegateThing = DelegateThing()
        let delegateThingDelegate = DelegateHandler()
        delegateThing.delegate = delegateThingDelegate
        delegateThing.doSomethingThatCallsDelegate(string: "Hello")
    
    }
    
}
