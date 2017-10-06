//
//  NetworkThingTests.swift
//  UnitTestingExamplesTests
//
//  Created by Scotty on 05/10/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import XCTest
import UnitTestingExamples

class NetworkThingTests: XCTestCase {
    
    func testMethodThatCallsTheNetwork() {
        
        class MockNetworkProvider: NetworkProvider {
            func getStringFromNetwork(withString: String, completion: @escaping (String?, Error?) -> ()) {
                DispatchQueue.global().async {
                    completion("Result String \(withString)", nil)
                }
            }
        }
        
        let networkThing = NetworkThing(networkProvider: MockNetworkProvider())
        let testExpectation = expectation(description: #function)
        
        networkThing.methodThatCallsTheNetwork(withString: "Test String") { (result, error) in
            XCTAssertNil(error)
            XCTAssertEqual(result,"methodThatCallsTheNetwork: Result String Test String")
            testExpectation.fulfill()
        }
        
        wait(for: [testExpectation], timeout: 1)
        
    }
    
    
    func testMethodThatCallsTheNetworkWithNoDataFoundError() {
        
        class MockNetworkProvider: NetworkProvider {
            func getStringFromNetwork(withString: String, completion: @escaping (String?, Error?) -> ()) {
                DispatchQueue.global().async {
                    completion(nil,nil)
                }
            }
        }
        
        let networkThing = NetworkThing(networkProvider: MockNetworkProvider())
        let testExpectation = expectation(description: #function)
        
        let testString = "Test String"
        networkThing.methodThatCallsTheNetwork(withString: testString) { (result, error) in
            XCTAssertNotNil(error)
            XCTAssertNil(result)
            testExpectation.fulfill()
        }
        
        wait(for: [testExpectation], timeout: 1)
    }
    
    func testMethodThatCallsTheNetworkWithNetworkError() {
        
        enum NetworkTestError: Error {
            case error
        }
        
        class MockNetworkProvider: NetworkProvider {
            func getStringFromNetwork(withString: String, completion: @escaping (String?, Error?) -> ()) {
                DispatchQueue.global().async {
                    completion(nil, NetworkTestError.error)
                }
            }
        }
        
        let networkThing = NetworkThing(networkProvider: MockNetworkProvider())
        let testExpectation = expectation(description: #function)
        
        let testString = "Test String"
        networkThing.methodThatCallsTheNetwork(withString: testString) { (result, error) in
            XCTAssertNotNil(error)
            XCTAssertNil(result)
            testExpectation.fulfill()
        }
        
        wait(for: [testExpectation], timeout: 1)
    }
    
}
