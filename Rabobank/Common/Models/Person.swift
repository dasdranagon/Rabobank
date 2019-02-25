//
//  Person.swift
//  Rabobank
//
//  Created by Dennis Skokov on 23/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import Foundation

struct Person {
    let firstName: String
    let surname: String
    let issueCount: Int
    let dateOfBirth: Date
}

extension Person: Equatable {}
