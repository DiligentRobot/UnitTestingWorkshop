//
//  AsynchronousThing.swift
//  UnitTestingExamples
//
//  Created by Scotty on 04/10/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import Foundation

public class AsynchronousThing {
    
    public init(){}
    
    public func asyncAdd(lhs: Int, rhs: Int, completion: @escaping (Int) -> ()) {
        DispatchQueue.global().async {
            let result = lhs + rhs
            completion(result)
        }
    }
}
