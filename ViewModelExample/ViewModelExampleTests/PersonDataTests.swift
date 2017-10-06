//
//  PersonDataTests.swift
//  ViewModelExampleTests
//
//  Created by Scotty on 03/10/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import XCTest
@testable import ViewModelExample

class PersonDataTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPersonDataInit() {
        
        let id = PersonId(id: "TestId")
        let firstName = "Steve"
        let lastName = "Scott"
        let position = "The Boss"
        
        let person = PersonData(id: id, firstName: firstName, lastName: lastName, position: position)
        
        XCTAssertEqual(person.id, id)
        XCTAssertEqual(person.firstName, firstName)
        XCTAssertEqual(person.lastName, lastName)
        XCTAssertEqual(person.position, position)
    }

}
