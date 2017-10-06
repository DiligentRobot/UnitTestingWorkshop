//
//  BasicThingWithState.swift
//  UnitTestingExamples
//
//  Created by Scotty on 04/10/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import Foundation

public class BasicThingWithState {
    
    public private(set) var value: Int
    
    public init(value: Int) {
        self.value = value
    }
    
    public func add(_ numberToAdd: Int) {
        value += numberToAdd
    }
    
}
