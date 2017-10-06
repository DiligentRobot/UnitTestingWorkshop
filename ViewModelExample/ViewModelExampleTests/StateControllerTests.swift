//
//  StateControllerTests.swift
//  ViewModelExampleTests
//
//  Created by Scotty on 06/10/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import XCTest
@testable import ViewModelExample

class StateControllerTests: XCTestCase {
    
    class MockStorageContoller: Storage {
        
        let people: [Person]
        
        init() {
            var people = [Person]()
            people.append(PersonData(id: PersonId(id: "Person 1"), firstName: "John", lastName: "Smith", position: "Worker"))
            people.append(PersonData(id: PersonId(id: "Person 2"), firstName: "Fred", lastName: "Jones", position: "Worker"))
            people.append(PersonData(id: PersonId(id: "Person 3"), firstName: "Billy", lastName: "Bigman", position: "Boss"))
            people.append(PersonData(id: PersonId(id: "Person 4"), firstName: "Jo", lastName: "Picky", position: "Manager"))
            self.people = people
        }
        
        func fetchPeople() -> [Person] {
            return people
        }
        
        func save(people: [Person]) {
            // Swallow this for now as we are not using it.
        }
    }
    
    func testStateControllerInit() {
        let stateController = StateController(storage:  MockStorageContoller())
        XCTAssertEqual(stateController.people.count, 4)
    }
    
}
