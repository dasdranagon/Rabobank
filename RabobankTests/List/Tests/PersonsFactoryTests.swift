//
//  PersonsFactoryTests.swift
//  RabobankTests
//
//  Created by Dennis Skokov on 28/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import Nimble
import Quick

@testable import Rabobank

class PersonsFactoryTests: QuickSpec {

    override func spec() {
        var factory: DefaultPersonsFactory!
        beforeEach {
            factory = DefaultPersonsFactory()
        }
        
        describe("create") {
            var createdPerson: Person?
            context("correct source object") {
                let stringDate = "1978-01-02T00:00:00"
                let date = Date(timeIntervalSince1970: 252547200)
                let row: [String] = ["\"Jon\"", "\"Doe\"", "5", "\"\(stringDate)\""]
                
                let expectedObject = Person(firstName: "Jon",
                                          surname: "Doe",
                                          issueCount: 5,
                                          dateOfBirth: date)
                beforeEach {
                    createdPerson = factory.create(row: row)
                }
                
                it("parses rows in person objects") {
                    expect(createdPerson).toEventually(equal(expectedObject))
                }
                
                it("parses first name") {
                    expect(createdPerson?.firstName).toEventually(equal("Jon"))
                }
                
                it("parses surname") {
                    expect(createdPerson?.surname).toEventually(equal("Doe"))
                }
                
                it("parses issues count") {
                    expect(createdPerson?.issueCount).toEventually(equal(5))
                }
                
                it("parses date of birdth") {
                    expect(createdPerson?.dateOfBirth).toEventually(equal(date))
                }
            }
            
            context("empty source object") {
                beforeEach {
                    createdPerson = factory.create(row: [])
                }
                
                it("returns nil") {
                    expect(createdPerson).toEventually(beNil())
                }
            }
            
            context("wrong amount of columns") {
                beforeEach {
                    createdPerson = factory.create(row: ["\"Jon\"", "\"Doe\"", "5"])
                }
                
                it("returns nil") {
                    expect(createdPerson).toEventually(beNil())
                }
            }
        }
    }

}
