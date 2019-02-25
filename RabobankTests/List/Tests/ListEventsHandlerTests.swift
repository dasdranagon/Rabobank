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
        var interactor: ListInteractorMock!
        var view: ListViewMock!

        beforeEach {
            interactor = ListInteractorMock()
            view = ListViewMock()

            presenter = ListPresenter()
            presenter.interactor = interactor
            presenter.view = view
        }

        describe("ready") {
            beforeEach {
                presenter.ready()
            }

            it("shows processing indicator") {
                expect(view.processingIndicatorWasShowed) == true
            }
            
            it("attempts to fetch data") {
                expect(interactor.fetchWasCalled) == true
            }
        }
        
        describe("refresh") {
            beforeEach {
                presenter.refresh()
            }
            
            it("shows processing indicator") {
                expect(view.processingIndicatorWasShowed) == true
            }
            
            it("attempts to fetch data") {
                expect(interactor.fetchWasCalled) == true
            }
        }
    }
}
