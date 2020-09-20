//
//  APIError.swift
//  Reddit
//
//  Created by Suneeth on 9/19/20.
//  Copyright © 2020 Suneeth. All rights reserved.
//

import Foundation


enum APIError: Error {
    case noNetwork
    case serverError
    case jsonError
    case noDataError
}

struct ErrorConstants {
    struct ErrorTitles {
        static let noNetwork = "Network Error"
        static let serverError = "Server Error"
        static let jsonError = "Internal Error"
        static let noDataError = "NoData Error"
    }
    struct ErrorMessages {
        static let noNetwork = "No internet connection. Please check the network settings."
        static let serverError = "Service unavailable now."
        static let jsonError = "Parsing failed"
        static let noDataError = "NoData Error"
    }
}

extension APIError {
    var errorTitle: String {
        switch self {
        case .noNetwork:
            return ErrorConstants.ErrorTitles.noNetwork
        case .serverError:
            return ErrorConstants.ErrorTitles.serverError
        case .jsonError:
            return ErrorConstants.ErrorTitles.jsonError
        case .noDataError:
                return ErrorConstants.ErrorTitles.noDataError
        }
    }
    var errorMessage: String {
        switch self {
        case .noNetwork:
            return ErrorConstants.ErrorMessages.noNetwork
        case .serverError:
            return ErrorConstants.ErrorMessages.serverError
        case .jsonError:
            return ErrorConstants.ErrorMessages.jsonError
        case .noDataError:
            return ErrorConstants.ErrorMessages.noDataError
        }
    }
}
