//
//  UINavigationItem+Utils.swift
//  Reddit
//
//  Created by Suneeth on 9/20/20.
//  Copyright © 2020 Suneeth. All rights reserved.
//

import UIKit

extension UINavigationItem {
    func navigationBar(with title: String) {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textAlignment = .center
        label.textColor = UIColor.navigationBarbuttonTextColor
        label.text = title
        self.titleView = label
    }
}
