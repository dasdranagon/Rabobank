//
//  TextParser.swift
//  Rabobank
//
//  Created by Dennis Skokov on 24/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import Foundation

protocol TextParser {
    typealias Row = [String]
    func parse(text: String) throws -> [Row]
}
