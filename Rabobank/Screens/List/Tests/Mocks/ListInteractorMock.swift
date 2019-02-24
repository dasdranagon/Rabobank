//
//  ListInteractorMock.swift
//  RabobankTests
//
//  Created by Dennis Skokov on 24/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

@testable import Rabobank

class ListInteractorMock: ListInteractor {
    var fetchWasCalled = false
    func fetch() {
        fetchWasCalled = true
    }
}
