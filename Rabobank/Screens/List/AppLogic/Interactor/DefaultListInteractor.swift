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
    
    weak var output: ListInteractorOutput!
    weak var errorHandler: ErrorHandler?
    
    init(source: TextSource, parser: TextParser) {
        self.source = source
        self.parser = parser
    }
    
    func fetch() {
        
    }
}
