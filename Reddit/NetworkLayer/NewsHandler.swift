//
//  NewsHandler.swift
//  Reddit
//
//  Created by Suneeth on 9/19/20.
//  Copyright © 2020 Suneeth. All rights reserved.
//

import Foundation

class NewsHandler {
    func getNewsFeed(completion: @escaping (SwiftNews?, APIError?) -> Void) {
        let getNewsFeedRouter = NewsRouter.getNewsFeed
        NetworkHandler().makeAPICall(router: getNewsFeedRouter, decodingType: SwiftNews.self) { (result) in
            switch result {
            case .success(let model):
                    completion(model as? SwiftNews, nil)
            case .failure(let error):
                    completion(nil, error)
            }
        }
    }
}
