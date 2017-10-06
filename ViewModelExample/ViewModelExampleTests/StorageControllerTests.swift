//
//  StorageControllerTests.swift
//  ViewModelExampleTests
//
//  Created by Scotty on 06/10/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import XCTest
@testable import ViewModelExample

class StorageControllerTests: XCTestCase {
    
    private func generateFileURL() -> URL {
        /// Documents Folder.
        let documentsDirectoryURL = FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first!
        
        // Build a full path for the plist we are going to read from/ save to
        let fileURL: URL = documentsDirectoryURL
            .appendingPathComponent(UUID().uuidString)
            .appendingPathExtension("plist")
        
        return fileURL
    }
    
    private func createTestFile(fileURL: URL) {
        
        var people = [PersonData]()
        people.append(PersonData(id: PersonId(id: "Person 1"), firstName: "John", lastName: "Smith", position: "Worker"))
        people.append(PersonData(id: PersonId(id: "Person 2"), firstName: "Fred", lastName: "Jones", position: "Worker"))
        people.append(PersonData(id: PersonId(id: "Person 3"), firstName: "Billy", lastName: "Bigman", position: "Boss"))
        people.append(PersonData(id: PersonId(id: "Person 4"), firstName: "Jo", lastName: "Picky", position: "Manager"))
        
        let array = people.map { $0.dataRepresentation } as NSArray
        array.write(to: fileURL, atomically: true)
        
        addTeardownBlock {
            self.removeFileAtURL(fileURL: fileURL)
        }
    }
    
    private func removeFileAtURL(fileURL: URL) {
        do {
            let fileManager = FileManager.default
            // Check that the file exists before trying to delete it.
            if fileManager.fileExists(atPath: fileURL.path) {
                // Perform the deletion.
                try fileManager.removeItem(at: fileURL)
                // Verify that the file no longer exists after the deletion.
                XCTAssertFalse(fileManager.fileExists(atPath: fileURL.path))
            }
        } catch {
            // Treat any errors during file deletion as a test failure.
            XCTFail("Error while deleting temporary file: \(error)")
        }
    }
    
    func testFetchPeople() {
        
        // We need a test file
        let fileURL = generateFileURL()
        createTestFile(fileURL: fileURL)
        let storageController = StorageController(peopleFileURL: fileURL)
        
        let people = storageController.fetchPeople()
        
        // Need better test that people are valid this is just to show the point.
        XCTAssertEqual(people.count, 4)
    }
    
}
