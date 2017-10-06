//
//  PersonId.swift
//  ViewModelExample
//
//  Created by Scotty on 06/10/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import Foundation

struct PersonId {
    let value: String
    
    init(id: String) {
        value = id
    }
}

extension PersonId: Equatable {
    static func ==(lhs: PersonId, rhs: PersonId) -> Bool {
        return lhs.value == rhs.value
    }
}
