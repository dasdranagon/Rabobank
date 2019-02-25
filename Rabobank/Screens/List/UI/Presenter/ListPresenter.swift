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
    
    private let dateFormatter: DateFormatter = {
        let formater = DateFormatter()
        formater.dateFormat = "dd.MM.yyyy"
        formater.timeZone = TimeZone(identifier: "UTC")
        return formater
    }()
}

extension ListPresenter: ListInteractorOutput {
    func update(items: [Person]) {
        view.processing(show: false)
        let displayItems = items.compactMap { [weak self] in self?.displayItem(for: $0) }
        view.update(items: displayItems)
    }
    
    private func displayItem(for person: Person) -> ListDisplayItem {
        let fullName = "\(person.firstName) \(person.surName)"
        let issueCount = "\(person.issueCount)"
        let dateOfBirth = dateFormatter.string(from: person.dateOfBirth)
        
        return ListDisplayItem(fullName: fullName, dateOfBirth: dateOfBirth, issueCount: issueCount)
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
