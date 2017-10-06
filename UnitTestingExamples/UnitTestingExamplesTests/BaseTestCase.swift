//
//  BaseTestCase.swift
//  UnitTestingExamplesTests
//
//  Created by Scotty on 05/10/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import XCTest

class BaseTestCase: XCTestCase {
    
    /// Stops test execution via `XCTFail` without the need to return a value.
    ///
    /// Similar to `fatalError()`, but triggers an `XCTFail` and ends the test
    /// immediately.
    func XCTTerminate(_ message: String = "", file: StaticString = #file, line: UInt = #line) -> Never {
        
        continueAfterFailure = false
        XCTFail(message, file: file, line: line)
        
        // This call to fatalError() will never be triggered because we set
        // `continueAfterFailure` to false. Nonetheless, it is needed to satisfy
        // the compiler.
        fatalError()
        
    }
    
    /// Unwraps an optional, returning the unwrapped value. Fails and ends the test
    /// gracefully via `XCTTerminate()` if the optional does not contain a value.
    func XCTUnwrap<Wrapped>(_ wrapped: Wrapped?, _ message: String = "", file: StaticString = #file, line: UInt = #line) -> Wrapped {
        guard let unwrapped = wrapped else {
            XCTTerminate(message, file: file, line: line)
        }
        return unwrapped
    }
    
    /// Performs a cast, returning a cast value of the requested type if the cast
    /// succeeds. Fails and ends the test gracefully via `XCTTerminate()` if the
    /// cast fails.
    func XCTCast<Original, Target>(_ original: Original, _ target: Target.Type, _ message: String = "", file: StaticString = #file, line: UInt = #line) -> Target {
        guard let cast = original as? Target else {
            let useMessage = !message.isEmpty ? message : "Unable to cast value of type \(Original.self) to type \(Target.self)."
            XCTTerminate(useMessage, file: file, line: line)
        }
        return cast
    }
    
    /// Zips two collections with the `zip(_:_:)` function, after checking that they
    /// are of the same length. Calls `XCTTerminate()` if the collections are not of
    /// the same length.
    func XCTZip<Collection1, Collection2>(_ collection1: Collection1, _ collection2: Collection2, file: StaticString = #file, line: UInt = #line) -> Zip2Sequence<Collection1, Collection2> where Collection1 : Collection, Collection2 : Collection, Collection1.IndexDistance == Int, Collection2.IndexDistance == Int {
        guard collection1.count == collection2.count else { XCTTerminate("Zip collections have different lengths (\(collection1.count), \(collection2.count)).", file: file, line: line) }
        return zip(collection1, collection2)
    }
    
    /// Asserts that a collection has the specified count, calling `XCTTerminate()`
    /// if it does not, to avoid subsequent out-of-bounds errors.
    func XCTEnforceCount<C: Collection>(_ collection: C, _ count: Int, file: StaticString = #file, line: UInt = #line) where C.IndexDistance == Int {
        guard collection.count == count else { XCTTerminate("Collection count is incorrect - expected \(count), found \(collection.count))", file: file, line: line) }
    }
    
    /// Asserts that a collection is empty.
    func XCTAssertEmpty<C: Collection>(_ collection: C, _ message: String = "", file: StaticString = #file, line: UInt = #line) {
        XCTAssert(collection.isEmpty, message, file: file, line: line)
    }
    
    /// Asserts that a collection is not empty.
    func XCTAssertNotEmpty<C: Collection>(_ collection: C, _ message: String = "", file: StaticString = #file, line: UInt = #line) {
        XCTAssert(!collection.isEmpty, message, file: file, line: line)
    }
}
