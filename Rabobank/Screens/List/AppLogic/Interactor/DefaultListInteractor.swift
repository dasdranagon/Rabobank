//
//  DefaultListInteractor.swift
//  Rabobank
//
//  Created by Dennis Skokov on 24/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import Foundation

class DefaultListInteractor: ListInteractor {
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
    
    private let source: TextSource
    private let parser: TextParser
    
    weak var output: ListInteractorOutput!
    weak var errorHandler: ErrorHandler?
    
    init(source: TextSource, parser: TextParser) {
        self.source = source
        self.parser = parser
    }
    
    func fetch() {
        source.fetch { [weak self] text in
            guard let text = text else {
                self?.proceed(error: .dataAccessError)
                return
            }
            
            self?.parse(text: text)
        }
    }
}

extension DefaultListInteractor {
    
    func parse(text: String) {
        DispatchQueue.global(qos: .utility).async { [weak self] in
            do {
                guard let rows = try self?.parser.parse(text: text) else {
                    self?.proceedInMainThread(error: .unknown)
                    return
                }
                self?.parse(rows: rows)

            } catch {
                self?.proceedInMainThread(error: .parsingError)
            }
        }
    }
    
    private func parse(rows: [TextParser.Row] ) {
        let persons = rows.dropFirst().compactMap { [weak self] row in
            return self?.convert(row: row)
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.proceed(persons: persons)
        }
    }
    
    private func convert(row: TextParser.Row) -> Person? {
        guard let issuCount = Int(row[Rows.issueCount.rawValue]) else {
            proceedInMainThread(error: .parsingError)
            return nil
        }
        
        let strDate = row[Rows.birthday.rawValue].trimmingCharacters(in: .punctuationCharacters)
        guard let date = dateFormatter.date(from: strDate) else {
            proceedInMainThread(error: .parsingError)
            return nil
        }
        
        let firstName = row[Rows.firstName.rawValue].trimmingCharacters(in: .punctuationCharacters)
        let surname = row[Rows.surname.rawValue].trimmingCharacters(in: .punctuationCharacters)
        
        return Person(firstName: firstName,
                      surname: surname,
                      issueCount: issuCount,
                      dateOfBirth: date)
    }
    
    private func proceedInMainThread(error: ListError) {
        DispatchQueue.main.async { [weak self] in
            self?.proceed(error: error)
        }
    }
}

extension DefaultListInteractor {
    func proceed(error: ListError) {
        errorHandler?.proceed(error: error)
        output.update(items: [])
    }
    
    func proceed(persons: [Person]) {
        output.update(items: persons)
    }
}
