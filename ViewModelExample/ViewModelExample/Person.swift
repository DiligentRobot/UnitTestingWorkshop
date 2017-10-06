//
//  Person.swift
//  ViewModelExample
//
//  Created by Scotty on 03/10/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import Foundation

protocol Person {
    var id: PersonId { get }
    var firstName: String { get }
    var lastName: String { get }
    var position: String { get }
    
    var dataRepresentation:  [String: AnyObject] { get }
}
