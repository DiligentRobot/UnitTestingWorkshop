//
//  PersonData+PlistRepresentation.swift
//  ViewModelExample
//
//  Created by Scotty on 06/10/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import Foundation

extension PersonData {
    var dataRepresentation: [String: AnyObject] {
        return [
            "id": id.value as AnyObject,
            "firstName": firstName as AnyObject,
            "lastName": lastName as AnyObject,
            "position": position as AnyObject
        ]
    }
    
    init(data: [String: AnyObject]) {
        id = PersonId(id: data["id"] as! String)
        firstName = data["firstName"] as! String
        lastName = data["lastName"] as! String
        position = data["position"] as! String
    }
}
