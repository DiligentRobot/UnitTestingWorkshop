//
//  DelegateThing.swift
//  UnitTestingExamples
//
//  Created by Scotty on 06/10/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import Foundation


public protocol DelegateThingDelegate: class {
    func delegateMethod(string: String)
}

public class DelegateThing {
    
    weak public var delegate: DelegateThingDelegate?
    public init() {}
    
    public func doSomethingThatCallsDelegate(string: String) {
        delegate?.delegateMethod(string: string)
    }
}
