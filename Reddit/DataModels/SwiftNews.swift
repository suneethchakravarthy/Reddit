//
//  SwiftNews.swift
//  Reddit
//
//  Created by Suneeth on 9/19/20.
//  Copyright © 2020 Suneeth. All rights reserved.
//

import Foundation

struct SwiftNews: Decodable {
    let kind: String?
    let data: SwiftNewsData?
}
struct SwiftNewsData: Decodable {
    let children: [ChildItem]?
}
struct ChildItem: Decodable {
    let kind: String?
    let data: ChildItemData?
}
struct ChildItemData: Decodable {
    let title: String?
    let thumbnail: String?
}
