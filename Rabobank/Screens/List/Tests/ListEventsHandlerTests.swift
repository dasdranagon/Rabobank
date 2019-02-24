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
        describe("ready") {
            it("test", closure: {
                expect("string").to(equal("Squee!"))
            })
        }
    }
//    override func spec() {
//        var listPresenter: ListPresenter!
//        var interactor: ListInteractorMock!
//        var view: ListViewMock!
//
//        beforeEach {
//            interactor = ListInteractorMock()
//            view = ListViewMock()
//
//            listPresenter = ListPresenter()
//            listPresenter.interactor = interactor
//            listPresenter.view = view
//        }
//
//        describe("ready") {
//            beforeEach {
//                listPresenter.ready()
//            }
//
//            it("shows top processing indicator") {
//                expect(view.processingIndicatorWasShowed) == true
//            }
//        }
//    }
}
