//
//  StateController.swift
//  ViewModelExample
//
//  Created by Scotty on 13/09/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import Foundation

/// Manages the data in the application
/// This is a very basic implementation that keep all the data in memory all the time.
class StateController {
    
    // The storage from whcich this StateController will get its data.
    private let storage: Storage
    
    // Store the people we get back from the StorageController
    private var _people = [String: Person]()
    
    var people: [Person] {
        return Array(_people.values)
    }
    
    
    init(storage: Storage) {
        self.storage = storage
        // Load the people from the Storage.
        for person in storage.fetchPeople() {
            _people[person.id.value] = person
        }
    }
    
    // Save a person
    func save(person: Person) {

        // Update the person in the list.
        _people[person.id.value] = person
        
        // Save all the people.
        storage.save(people: people)
    }
}


