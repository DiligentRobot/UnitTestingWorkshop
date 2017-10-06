//
//  NotificationThing.swift
//  UnitTestingExamples
//
//  Created by Scotty on 04/10/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import Foundation

public class NotificationThing {
    
    public static let notificationName: NSNotification.Name = NSNotification.Name(rawValue: "NotificationThing-Notification")
    public static let notificationName2: NSNotification.Name = NSNotification.Name(rawValue: "NotificationThing-Notification2")
    
    public let notificationCenter: NotificationCenter
    
    public init(notificationCenter: NotificationCenter = NotificationCenter.default) {
        self.notificationCenter = notificationCenter
    }
    
    public func methodThatPostsNotification() {
        notificationCenter.post(name: NotificationThing.notificationName, object: self)
    }
    
    // This function post 2 NotificationThing-Notification notifications
    // and 1 NotificationThing-Notification2 notification
    public func methodThatsPostsThreeNotifications() {
        notificationCenter.post(name: NotificationThing.notificationName, object: self)
        notificationCenter.post(name: NotificationThing.notificationName2, object: self)
        notificationCenter.post(name: NotificationThing.notificationName, object: self)
    }
}
