//
//  ListError.swift
//  Rabobank
//
//  Created by Dennis Skokov on 25/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import Foundation

enum ListError: Error {
    case dataAccessError
    case parsingError
    case unknown
}

extension ListError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .dataAccessError: return NSLocalizedString("Cannot read CSV file", comment: "data access error")
        case .parsingError: return NSLocalizedString("Unexpected content of CSV file", comment: "parsing error")
        case .unknown: return NSLocalizedString("Unknown error occurred", comment: "unknown error")
        }
    }
}
