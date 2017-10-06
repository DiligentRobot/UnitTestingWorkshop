//
//  PrivateThingTests.swift
//  UnitTestingExamplesTests
//
//  Created by Scotty on 04/10/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import XCTest
@testable import UnitTestingExamples

class PrivateThingTests: XCTestCase {
    
    func testReturnTheNumberOne() {
        let privateThing = PrivateThing()
        let result = privateThing.returnTheNumberOne()
        XCTAssertEqual(result, 1)
    }
}
