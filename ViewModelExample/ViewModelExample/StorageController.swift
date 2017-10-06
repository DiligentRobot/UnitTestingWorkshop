//
//  StorageController.swift
//  ViewModelExample
//
//  Created by Scotty on 13/09/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import Foundation

/// Used to read and save persisited data.
/// This is a very basic implementation that uses a plist as its persistent store.
class StorageController: Storage {
    
    // Build a full path for the plist we are going to read from/ save to
    fileprivate var peopleFileURL: URL
    
    init(peopleFileURL: URL) {
        self.peopleFileURL = peopleFileURL
    }
    
    // Save the people back to a plist.
    func save(people: [Person]) {
        
        // Get each person to build its plist representation.
        let peoplePlist = people.map { $0.dataRepresentation } as NSArray
        
        // Save the people to the plist
        let fileURL = peopleFileURL
        guard peoplePlist.write(to: fileURL, atomically: true) else {
            fatalError("Failed to Save File")
        }
    }
    
    func fetchPeople() -> [Person] {
        
        let fileURL = peopleFileURL
        
        guard let peoplePlists = NSArray(contentsOf: fileURL) as? [[String: AnyObject]] else {
            
            // We have no data so create so demo data
            
            var people = [Person]()
            for i in 0...49 {
                people.append(PersonData(id: PersonId(id: UUID().uuidString),
                                                 firstName: "First Name \(i)",
                                                 lastName: "Last Name \(i)",
                                                 position: "Position: \(i)"))
                
            }
            save(people: people)
            return people
        }
        return peoplePlists.map { PersonData(data:$0) }
    }
}

