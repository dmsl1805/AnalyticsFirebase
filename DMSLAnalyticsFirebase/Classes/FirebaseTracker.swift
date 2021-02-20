//
//  FirebaseTracker.swift
//  DMSLAnalyticsFirebase
//
//  Created by Dmytro Shulzhenko on 20.02.2021.
//

import Foundation
import FirebaseAnalytics
import DMSLAnalyticsCore

public struct FirebaseTracker: EventTrackingProxy {
    public init() { }
    
    public func track(application: UIApplication,
                      didFinishLaunchingWithOptions options: [UIApplication.LaunchOptionsKey : Any]?) { }
    
    public func trackBecomeActive() { }

    public func track(event: Event) {
        Analytics.logEvent(event.name, parameters: event.params)
    }
    
    public func update(userProperties: [String : NSObject]) {
        userProperties.forEach {
            Analytics.setUserProperty(String(describing: $0.value), forName: $0.key)
        }
    }
    
    public func update(userId: String) {
        Analytics.setUserID(userId)
    }
}
