//
//  TextParserMock.swift
//  RabobankTests
//
//  Created by Dennis Skokov on 25/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

@testable import Rabobank

class TextParserMock: TextParser {
    var textToParse: String?
    var rowsToReturn: [Row]!
    var error: Error?
    func parse(text: String) throws -> [Row] {
        if let error = error  {
            throw error
        }
        
        textToParse = text
        return rowsToReturn
        
    }
}
