//
//  DefaultListInteractor.swift
//  Rabobank
//
//  Created by Dennis Skokov on 24/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import Foundation

class DefaultListInteractor: ListInteractor {
    private let source: TextSource
    private let parser: TextParser
    private let factory = PersonsFactory()
    
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
            return self?.factory.person(by: row)
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.proceed(persons: persons)
        }
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
