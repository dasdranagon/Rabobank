//
//  ListInteractorTests.swift
//  RabobankTests
//
//  Created by Dennis Skokov on 25/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import Nimble
import Quick

@testable import Rabobank

class ListInteractorTests: QuickSpec {
    override func spec() {
        var interactor: DefaultListInteractor!
        var output: ListInteractorOutputMock!
        var errorHandler: ErrorHandlerMock!
        var source: TextSourceMock!
        var parser: TextParserMock!
        
        beforeEach {
            source = TextSourceMock()
            parser = TextParserMock()
            output = ListInteractorOutputMock()
            errorHandler = ErrorHandlerMock()
            
            interactor = DefaultListInteractor(source: source, parser: parser)
            interactor.output = output
            interactor.errorHandler = errorHandler
        }
        
        describe("fetch") {
            context("common") {
                beforeEach {
                    interactor.fetch()
                }
                
                it("reads data from source") {
                    expect(source.fetchWasCalled) == true
                }
            }
            
            context("not able to read text") {
                beforeEach {
                    source.textToReturn = nil
                    interactor.fetch()
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
                        interactor.fetch()
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
                        interactor.fetch()
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
                        interactor.fetch()
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
