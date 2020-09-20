//
//  UINavigationController+NavigationBar.swift
//  Reddit
//
//  Created by Suneeth on 9/19/20.
//  Copyright © 2020 Suneeth. All rights reserved.
//

import UIKit

extension UINavigationController {
    func setNavigationBar(){
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.navigationBarbuttonTextColor]
        navigationBar.tintColor = UIColor.navigationBarbuttonTextColor
        navigationBar.barTintColor = UIColor.navigationBarColor
        navigationBar.titleTextAttributes = textAttributes
    }
}

