//
//  AppDelegate.swift
//  Short Daily Devotions
//
//  Created by Matt Bush on 8/26/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        Configuration.setupServices(launchOptions)
        Configuration.run(window)
        return true
    }
}
