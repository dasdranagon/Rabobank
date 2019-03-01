//
//  ListDataSourceOutputMock.swift
//  RabobankTests
//
//  Created by Dennis Skokov on 25/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

@testable import Rabobank

class ListDataSourceOutputMock: ListDataSourceOutput {
    var items: [Person]?
    func update(items: [Person]) {
        self.items = items
    }
}
