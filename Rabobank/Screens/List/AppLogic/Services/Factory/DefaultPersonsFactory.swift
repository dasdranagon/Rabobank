//
//  DefaultPersonsFactory.swift
//  Rabobank
//
//  Created by Dennis Skokov on 28/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import Foundation

class DefaultPersonsFactory: PersonsFactory {
    
    private let dateFormatter: DateFormatter = {
        let formater = DateFormatter()
        formater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formater.timeZone = TimeZone(identifier: "UTC")
        return formater
    }()
    
    enum Columns: Int, CaseIterable {
        case firstName
        case surname
        case issueCount
        case birthday
    }
    
    func create(row: [String]) -> Person? {
        guard row.count >= Columns.allCases.count else { return nil }
        guard let issuCount = Int(row[Columns.issueCount.rawValue]) else { return nil }
        
        let strDate = row[Columns.birthday.rawValue].trimmingCharacters(in: .punctuationCharacters)
        guard let date = dateFormatter.date(from: strDate) else { return nil }
        
        let firstName = row[Columns.firstName.rawValue].trimmingCharacters(in: .punctuationCharacters)
        let surname = row[Columns.surname.rawValue].trimmingCharacters(in: .punctuationCharacters)
        
        return Person(firstName: firstName,
                      surname: surname,
                      issueCount: issuCount,
                      dateOfBirth: date)
    }
}

