//
//  NetworkThing.swift
//  UnitTestingExamples
//
//  Created by Scotty on 05/10/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import Foundation

public enum NetworkThingError: Error {
    case noDataFoundForString(string: String)
}

public protocol NetworkProvider {
    func getStringFromNetwork(withString: String, completion: @escaping (String?, Error?) -> ())
}

public class NetworkThing {
    
    let networkProvider: NetworkProvider
    
    public init(networkProvider: NetworkProvider){
        self.networkProvider = networkProvider
    }
    
    public func methodThatCallsTheNetwork(withString: String, completion: @escaping (String?, Error?) -> ()) {
        networkProvider.getStringFromNetwork(withString: withString) { result, error in
            
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let result = result else {
                completion(nil, NetworkThingError.noDataFoundForString(string: withString))
                return 
            }
            
            let finalResult = "methodThatCallsTheNetwork: \(result)"
            completion(finalResult, error)
        }
    }
}

