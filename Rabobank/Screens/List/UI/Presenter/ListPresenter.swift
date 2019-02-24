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
        let i1 = ListDisplayItem(
            fullName: "Name",
            dateOfBirth: "11.03.2011",
            issueCount: "1")
        
        let i2 = ListDisplayItem(
            fullName: "Name 2",
            dateOfBirth: "11.03.2010",
            issueCount: "2")
        
        let i3 = ListDisplayItem(
            fullName: "Name 3",
            dateOfBirth: "11.03.2018",
            issueCount: "3")
        
        let i4 = ListDisplayItem(
            fullName: "Name 4",
            dateOfBirth: "11.03.2014",
            issueCount: "4")
        
        let items = [i1, i2, i3, i4]
        
        let deadlineTime = DispatchTime.now() + .seconds(3)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) { [weak self] in
            self?.view.processing(show: false)
            self?.view.update(items: items)
            
        }
    }
}
