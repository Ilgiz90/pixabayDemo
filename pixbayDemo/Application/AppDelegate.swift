//
//  AppDelegate.swift
//  pixbayDemo
//
//  Created by Ilgiz Fazlyev on 13.09.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else {
            return false
        }
        window.rootViewController = HomeWireframe().viewController
        window.makeKeyAndVisible()
        return true
    }
}

