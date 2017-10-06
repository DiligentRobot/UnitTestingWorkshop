//
//  PersonDataDataRepresentationTests.swift
//  ViewModelExampleTests
//
//  Created by Scotty on 06/10/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import XCTest
@testable import ViewModelExample

class PersonDataDataRepresentationTests: XCTestCase {
    
    func testPersonDataDataRepresentation() {
        
        let id = PersonId(id: "TestId")
        let firstName = "Steve"
        let lastName = "Scott"
        let position = "The Boss"
        
        let person = PersonData(id: id, firstName: firstName, lastName: lastName, position: position)
        
        let data = person.dataRepresentation
        
        XCTAssertEqual(data["id"] as? String, "TestId")
        XCTAssertEqual(data["firstName"] as? String, firstName)
        XCTAssertEqual(data["lastName"] as? String, lastName)
        XCTAssertEqual(data["position"] as? String, position)
    }
    
    func testPersonDataInitFromDataRepresentation() {
        
        let id = PersonId(id: "TestId")
        let firstName = "Steve"
        let lastName = "Scott"
        let position = "The Boss"
        
        let person = PersonData(id: id, firstName: firstName, lastName: lastName, position: position)
        
        let data = person.dataRepresentation
        
        let person2 = PersonData(data: data)
        
        XCTAssertEqual(person2.id, person.id)
        XCTAssertEqual(person2.firstName, person.firstName)
        XCTAssertEqual(person2.lastName, person.lastName)
        XCTAssertEqual(person2.position, person.position)
    }
    
}
