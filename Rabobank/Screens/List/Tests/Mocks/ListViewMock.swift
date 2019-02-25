//
//  ListViewMock.swift
//  RabobankTests
//
//  Created by Dennis Skokov on 24/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

@testable import Rabobank

class ListViewMock: ListView {
    var updatedItems: [ListDisplayItem]?
    func update(items: [ListDisplayItem]) {
        updatedItems = items
    }
    
    var processingIndicatorWasShowed: Bool?
    func processing(show: Bool) {
        processingIndicatorWasShowed = show
    }
}
