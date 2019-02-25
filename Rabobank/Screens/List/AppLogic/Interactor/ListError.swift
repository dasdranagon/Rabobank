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
