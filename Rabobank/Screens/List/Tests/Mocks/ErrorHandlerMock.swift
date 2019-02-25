//
//  ErrorHandlerMock.swift
//  RabobankTests
//
//  Created by Dennis Skokov on 25/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

@testable import Rabobank

class ErrorHandlerMock: ErrorHandler {
    var error: Error?
    func proceed(error: Error) {
        self.error = error
    }
}
