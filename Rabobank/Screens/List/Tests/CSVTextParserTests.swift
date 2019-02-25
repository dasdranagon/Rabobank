//
//  CSVTextParserTests.swift
//  RabobankTests
//
//  Created by Dennis Skokov on 25/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import Nimble
import Quick

@testable import Rabobank

class CSVTextParserTests: QuickSpec {
    override func spec() {
        var parser: CSVTextParser!
        
        beforeEach {
            parser = CSVTextParser()
        }
        
        describe("parse") {
            context("valid text source") {
                 var parsingResult: [CSVTextParser.Row]?
                
                let text = """
"First name","Sur name","Issue count","Date of birth"
"Theo","Jansen",5,"1978-01-02T00:00:00"
"Fiona","de Vries",7,"1950-11-12T00:00:00"
"Petra","Boersma",1,"2001-04-20T00:00:00"
"""
                let expectedParsingResult: [CSVTextParser.Row] = [
                    ["\"First name\"","\"Sur name\"","\"Issue count\"","\"Date of birth\""],
                    ["\"Theo\"","\"Jansen\"","5","\"1978-01-02T00:00:00\""],
                    ["\"Fiona\"","\"de Vries\"","7","\"1950-11-12T00:00:00\""],
                    ["\"Petra\"","\"Boersma\"","1","\"2001-04-20T00:00:00\""]]
                
                beforeEach {
                    parsingResult = try? parser.parse(text: text)
                }
                
                it("parses text") {
                    expect(parsingResult) == expectedParsingResult
                }
            }
            
            context("invalid text source") {
                var parsingError: Error?
                beforeEach {
                    do {
                        _ = try parser.parse(text: "")
                    } catch {
                        parsingError = error
                    }
                }
                
                it("throws a parsing error") {
                    expect(parsingError).notTo(beNil())
                }
            }
        }
    }
}
