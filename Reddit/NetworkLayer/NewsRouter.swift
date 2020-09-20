//
//  NewsRouter.swift
//  Reddit
//
//  Created by Suneeth on 9/19/20.
//  Copyright © 2020 Suneeth. All rights reserved.
//

import Foundation

enum NewsRouter {
    case getNewsFeed
}

extension NewsRouter: NetworkConfiguration {
    var method: HTTPMethod {
        switch self {
        case .getNewsFeed:
            return .get
        }
    }
    var path: String? {
        switch self {
        case .getNewsFeed:
            return "/r/swift/.json"
        }
        
    }
    var headers: [String : String]? {
        switch self {
        case .getNewsFeed:
            return ["Content-Type":"application/json"]
        }
        
    }
    var bodyparameters: [String : Any]? {
        switch self {
        case .getNewsFeed:
            return [:]
        }
    }
}
