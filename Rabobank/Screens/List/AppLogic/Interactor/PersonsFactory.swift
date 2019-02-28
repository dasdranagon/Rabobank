//
//  PersonsFactory.swift
//  Rabobank
//
//  Created by Dennis Skokov on 28/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import Foundation

class PersonsFactory {
    private let dateFormatter: DateFormatter = {
        let formater = DateFormatter()
        formater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formater.timeZone = TimeZone(identifier: "UTC")
        return formater
    }()
    
    enum Rows: Int {
        case firstName
        case surname
        case issueCount
        case birthday
    }
    
    func person(by row: TextParser.Row) -> Person? {
        guard let issuCount = Int(row[Rows.issueCount.rawValue]) else {
            return nil
        }
        
        let strDate = row[Rows.birthday.rawValue].trimmingCharacters(in: .punctuationCharacters)
        guard let date = dateFormatter.date(from: strDate) else {
            return nil
        }
        
        let firstName = row[Rows.firstName.rawValue].trimmingCharacters(in: .punctuationCharacters)
        let surname = row[Rows.surname.rawValue].trimmingCharacters(in: .punctuationCharacters)
        
        return Person(firstName: firstName,
                      surname: surname,
                      issueCount: issuCount,
                      dateOfBirth: date)
    }
}

