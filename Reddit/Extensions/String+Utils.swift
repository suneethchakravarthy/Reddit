//
//  String+Utils.swift
//  Reddit
//
//  Created by Suneeth on 9/19/20.
//  Copyright © 2020 Suneeth. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var capitalizingFirstLetter: String {
        return prefix(1).uppercased() + self.dropFirst()
    }
    func isValidImageUrl() -> Bool {
        if let url = NSURL(string: self) {
            return UIApplication.shared.canOpenURL(url as URL)
        }
        return false
    }
}
