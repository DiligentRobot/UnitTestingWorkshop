//
//  PersonData.swift
//  ViewModelExample
//
//  Created by Scotty on 03/10/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import Foundation

struct PersonData: Person {
    
    var id: PersonId
    let firstName: String
    let lastName: String
    let position: String
    
    init(id: PersonId, firstName: String, lastName: String, position: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.position = position
    }
}
