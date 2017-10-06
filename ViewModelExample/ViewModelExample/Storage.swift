//
//  Storage.swift
//  ViewModelExample
//
//  Created by Scotty on 06/10/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import Foundation

protocol Storage {
    func fetchPeople() -> [Person]
    func save(people: [Person])
}
