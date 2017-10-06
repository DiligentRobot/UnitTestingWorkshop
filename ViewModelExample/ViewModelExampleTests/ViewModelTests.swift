//
//  ViewModelTests.swift
//  ViewModelExampleTests
//
//  Created by Scotty on 03/10/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import XCTest
@testable import ViewModelExample

class ViewModelTests: XCTestCase {
    
    func testViewModelInitWithPerson() {
        
        let person = PersonData(id: PersonId(id: "TestId"), firstName: "Steve", lastName: "Scott", position: "The Boss")
        let expectedName = "Steve Scott"

        let viewModel = ViewModel(person: person, index: 3)
        
        XCTAssertEqual(viewModel.name, expectedName)
        XCTAssertEqual(viewModel.position, person.position)
        XCTAssertEqual(viewModel.color, .sunflowerYellow)
    }
    
}
