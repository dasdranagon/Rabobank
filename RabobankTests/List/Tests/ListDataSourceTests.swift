//
//  ListDataSourceTests.swift
//  RabobankTests
//
//  Created by Dennis Skokov on 25/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import Nimble
import Quick

@testable import Rabobank

class ListDataSourceTests: QuickSpec {
    override func spec() {
        var dataSource: DefaultListDataSource!
        var output: ListDataSourceOutputMock!
        var errorHandler: ErrorHandlerMock!
        var source: TextSourceMock!
        var parser: TextParserMock!
        
        beforeEach {
            source = TextSourceMock()
            parser = TextParserMock()
            output = ListDataSourceOutputMock()
            errorHandler = ErrorHandlerMock()
            
            dataSource = DefaultListDataSource(source: source, parser: parser)
            dataSource.output = output
            dataSource.errorHandler = errorHandler
        }
        
        describe("fetch") {
            context("common") {
                beforeEach {
                    dataSource.fetch()
                }
                
                it("reads data from source") {
                    expect(source.fetchWasCalled) == true
                }
            }
            
            context("not able to read text") {
                beforeEach {
                    source.textToReturn = nil
                    dataSource.fetch()
                }
                
                it("proceeds en error") {
                    expect(errorHandler.error).notTo(beNil())
                }
                
                it("proceeds en empty array in output") {
                    expect(output.items?.count) == 0
                }
            }
            
            context("able to read text") {
                let text = "Some text"
                context("common") {
                    beforeEach {
                        source.textToReturn = text
                        parser.rowsToReturn = [["", "", "", ""]]
                        dataSource.fetch()
                    }
                    
                    it("passes text to the parser") {
                        expect(parser.textToParse).toEventually(equal(text))
                    }
                }
                
                context("not able to parse") {
                    let error = EmptyError()
                    beforeEach {
                        source.textToReturn = text
                        parser.error = error
                        dataSource.fetch()
                    }
                    
                    it("proceeds en empty array in output") {
                        expect(output.items?.count).toEventually(equal(0))
                    }
                }
                
                context("able to parse") {
                    let stringDate = "1978-01-02T00:00:00"
                    let date = Date(timeIntervalSince1970: 252547200)
                    let parsedObject: [[String]] = [["\"First name\"","\"Sur name\"","\"Issue count\"","\"Date of birth\""],
                                                    ["\"Jon\"", "\"Doe\"", "5", "\"\(stringDate)\""]]
                    
                    let parsedPerson = Person(firstName: "Jon",
                                              surname: "Doe",
                                              issueCount: 5,
                                              dateOfBirth: date)
                    beforeEach {
                        source.textToReturn = text
                        parser.rowsToReturn = parsedObject
                        dataSource.fetch()
                    }
                    
                    it("skips header") {
                        expect(output.items?.count).toEventually(equal(1))
                    }
                    
                    it("parses rows in person objects") {
                        expect(output.items?.first).toEventually(equal(parsedPerson))
                    }
                }
            }
        }
    }
}
