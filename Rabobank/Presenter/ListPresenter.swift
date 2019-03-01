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
    weak var dataSource: ListDataSource!
    
    private let loadingLock = Lock()
    
    private let dateFormatter: DateFormatter = {
        let formater = DateFormatter()
        formater.dateFormat = "dd.MM.yyyy"
        formater.timeZone = TimeZone(identifier: "UTC")
        return formater
    }()
}

extension ListPresenter: ListDataSourceOutput {
    func update(items: [Person]) {
        let displayItems = items.compactMap { [weak self] in self?.displayItem(for: $0) }
        view.update(items: displayItems)
        
        loadingLock.release()
        view.processing(show: false)
    }
    
    private func displayItem(for person: Person) -> ListDisplayItem {
        let fullName = "\(person.firstName) \(person.surname)"
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
        loadingLock.lock { [weak self] in
            self?.view.processing(show: true)
            self?.dataSource.fetch()
        }
    }
}
