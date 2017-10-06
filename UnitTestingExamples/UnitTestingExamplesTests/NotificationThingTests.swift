//
//  NotificationThingTests.swift
//  UnitTestingExamplesTests
//
//  Created by Scotty on 04/10/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import XCTest
import UnitTestingExamples

class NotificationThingTests: XCTestCase {
    
    
    func testDefaultNotificationCenterSetOnInit() {
        let notificationThing = NotificationThing()
        XCTAssertEqual(notificationThing.notificationCenter, NotificationCenter.default)
    }
    
    func testCustomNotificationCenterSetOnInit() {
        let notificationCenter = NotificationCenter()
        let notificationThing = NotificationThing(notificationCenter: notificationCenter)
        XCTAssertEqual(notificationThing.notificationCenter, notificationCenter)
    }
    
    func testMethodThatPostsNotification() {
        
        class TestMethodThatPostsNotificationExpectation: XCTestExpectation {
            @objc func notificationReceived(notification: NSNotification) {
                fulfill()
            }
        }
        
        let notificationThing = NotificationThing()
        let testExpectation = TestMethodThatPostsNotificationExpectation(description: #function)
        
        notificationThing.notificationCenter.addObserver(testExpectation, selector: #selector(testExpectation.notificationReceived), name: NotificationThing.notificationName, object: notificationThing)
        
        notificationThing.methodThatPostsNotification()
        
        wait(for: [testExpectation], timeout: 1)
        
    }
    
    func testMethodThatPostsThreeNotification() {
        
        class TestMethodThatPostsThreeNotificationExpectation1: XCTestExpectation {
            @objc func notificationReceived(notification: NSNotification) {
                fulfill()
            }
        }
        
        class TestMethodThatPostsThreeNotificationExpectation2: XCTestExpectation {
            @objc func notificationReceived(notification: NSNotification) {
                fulfill()
            }
        }
        
        let notificationThing = NotificationThing()
        
        let testExpectation1 = TestMethodThatPostsThreeNotificationExpectation1(description: #function + "(1)")
        testExpectation1.expectedFulfillmentCount = 2
        
        let testExpectation2 = TestMethodThatPostsThreeNotificationExpectation2(description: #function + "(2)")
        
        notificationThing.notificationCenter.addObserver(testExpectation1, selector: #selector(testExpectation1.notificationReceived), name: NotificationThing.notificationName, object: notificationThing)
        
        notificationThing.notificationCenter.addObserver(testExpectation2, selector: #selector(testExpectation2.notificationReceived), name: NotificationThing.notificationName2, object: notificationThing)
        
        notificationThing.methodThatsPostsThreeNotifications()
        
        wait(for: [testExpectation1, testExpectation2], timeout: 1)
        
    }
    
}
