//
//  ListDataSourceOutputTests.swift
//  RabobankTests
//
//  Created by Dennis Skokov on 24/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import Nimble
import Quick

@testable import Rabobank

class ListDataSourceOutputTests: QuickSpec {
    override func spec() {
        var presenter: ListPresenter!
        var view: ListViewMock!
        
        beforeEach {
            view = ListViewMock()
            
            presenter = ListPresenter()
            presenter.view = view
        }
        
        describe("update") {
            context("common") {
                beforeEach {
                    presenter.update(items: [])
                }
                
                it("stops progressing") {
                    expect(view.processingIndicatorWasShowed) == false
                }
                
                it("updates display items") {
                    expect(view.updatedItems).notTo(beNil())
                }
            }
            
            context("non empty list") {
                let person = Person(firstName: "Jon",
                           surname: "Doe",
                           issueCount: 3,
                           dateOfBirth: Date(timeIntervalSince1970: 541241571)) // 25.02.1987
                beforeEach {
                    presenter.update(items: [person])
                }
                
                it("presents non empty list") {
                    expect(view.updatedItems?.count) > 0
                }
                
                it("makes correct full name") {
                    expect(view.updatedItems?.first?.fullName) == "Jon Doe"
                }
                
                it("makes correct counter") {
                    expect(view.updatedItems?.first?.issueCount) == "3"
                }
                
                it("makes correct date") {
                    expect(view.updatedItems?.first?.dateOfBirth) == "25.02.1987"
                }
            }
        }
    }
}
