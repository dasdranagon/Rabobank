//
//  CSVTextParser.swift
//  Rabobank
//
//  Created by Dennis Skokov on 24/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import Foundation

class CSVTextParser: TextParser {
    func parse(text: String) throws -> [Row] {
        
        var rows: [Row] = []
        text.enumerateLines { line, _ in
            rows.append(line.components(separatedBy: CharacterSet(arrayLiteral: ",")))
        }
        
        guard rows.count > 0 else { throw CSVTextParserError.notFound }
        return rows
    }
}

enum CSVTextParserError: Error {
    case notFound
}
