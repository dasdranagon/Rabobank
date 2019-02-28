//
//  ListAssembly.swift
//  Rabobank
//
//  Created by Dennis Skokov on 22/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import UIKit

class ListAssembly {
    var wireframe: ListWireframe!
    var presenter: ListPresenter!
    var interactor: DefaultListInteractor!
    
    func configure() {
        let navigator = dependencies.navigator
        let source = BundleTextSource(resource: "issues", ofType: "csv")
        let parser = CSVTextParser()
        
        interactor = DefaultListInteractor(source: source, parser: parser)
        
        presenter = ListPresenter()
        presenter.interactor = interactor
        interactor.output = presenter
        
        wireframe = ListWireframe(navigator: navigator)
        wireframe.viewControllerFactory = self
    }
}

extension ListAssembly: ViewControllerFactory {
    func createViewController() -> UIViewController {
        let viewController = initialControllerFromStoryboard() as! ListTableViewController
 
        presenter.view = viewController
        viewController.evensHandler = presenter
        interactor.errorHandler = viewController
        
        return viewController
    }
}
