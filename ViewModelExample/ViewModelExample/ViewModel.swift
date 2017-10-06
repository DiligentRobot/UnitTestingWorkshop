//
//  ViewModel.swift
//  ViewModelExample
//
//  Created by Scotty on 03/10/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import UIKit

struct ViewModel {
    let name: String
    let position: String
    let color: UIColor
    
    init(person: Person, index: Int) {
        name = (person.firstName + " " + person.lastName).trimmingCharacters(in: .whitespacesAndNewlines)
        position = person.position
        color = UIColor.color(for: index)
    }
}
