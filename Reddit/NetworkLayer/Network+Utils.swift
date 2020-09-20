//
//  Network+Utils.swift
//  Reddit
//
//  Created by Suneeth on 9/19/20.
//  Copyright © 2020 Suneeth. All rights reserved.
//

import Foundation

extension Reachability {
    public static func isNetwrokReachable() -> Bool {
        let connection = try? Reachability().connection
        if connection == .unavailable {
            return false
        }
        return true
    }
}
