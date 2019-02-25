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
    }
}
