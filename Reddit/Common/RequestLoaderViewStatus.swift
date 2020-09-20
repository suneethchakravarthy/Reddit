//
//  RequestLoaderViewStatus.swift
//  Reddit
//
//  Created by Suneeth on 9/19/20.
//  Copyright © 2020 Suneeth. All rights reserved.
//

import Foundation

enum LoadingStyle {
    case covering
}

enum ViewStatus {
    case idle
    case loading(loadStyle: LoadingStyle, title: String? = nil, subtitle: String? = nil)
    case loaded
}

enum ErrorStyle {
    case alert
}

protocol RequestLoaderViewStatus {
    func loadingStyle() -> LoadingStyle
    func loadingTitle() -> String?
    func loadingSubTitle() -> String?
}

extension RequestLoaderViewStatus {
    func loadingStyle() -> LoadingStyle {
        return .covering
    }
    func loadingTitle() -> String? {
        return "Loading"
    }
    func loadingSubTitle() -> String? {
        return nil
    }
}
