//
//  ListPresenter.swift
//  Rabobank
//
//  Created by Dennis Skokov on 22/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import Foundation

class ListPresenter {
    weak var view: ListView!
    weak var interactor: ListInteractor!
}

extension ListPresenter: ListInteractorOutput {
    func update(items: [Person]) {
        
    }
}

extension ListPresenter: ListEventsHandler {
    
    func refresh() {
        load()
    }
    
    func ready() {
        load()
    }
    
    private func load() {
        view.processing(show: true)
        interactor.fetch()
    }
}
