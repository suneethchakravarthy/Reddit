//
//  AppDelegate.swift
//  Reddit
//
//  Created by Suneeth on 9/19/20.
//  Copyright © 2020 Suneeth. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setCustomRootViewController()
        return true
    }
    private func setCustomRootViewController() {
        let mainNavigationController = MainSharedViewController()
        mainNavigationController.viewModel = MainSharedViewModel(with: .main)
        window?.rootViewController = mainNavigationController
    }
}

