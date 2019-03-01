//
//  ListEventsHandlerTests.swift
//  RabobankTests
//
//  Created by Dennis Skokov on 24/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import Nimble
import Quick

@testable import Rabobank

class ListEventsHandlerTests: QuickSpec {
    override func spec() {
        var presenter: ListPresenter!
        var dataSource: ListDataSourceMock!
        var view: ListViewMock!

        beforeEach {
            dataSource = ListDataSourceMock()
            view = ListViewMock()

            presenter = ListPresenter()
            presenter.dataSource = dataSource
            presenter.view = view
        }

        describe("ready") {
            beforeEach {
                presenter.ready()
            }

            it("shows processing dataSource") {
                expect(view.processingIndicatorWasShowed) == true
            }
            
            it("attempts to fetch data") {
                expect(dataSource.fetchWasCalled) == true
            }
        }
        
        describe("refresh") {
            beforeEach {
                presenter.refresh()
            }
            
            it("shows processing dataSource") {
                expect(view.processingIndicatorWasShowed) == true
            }
            
            it("attempts to fetch data") {
                expect(dataSource.fetchWasCalled) == true
            }
        }
    }
}
