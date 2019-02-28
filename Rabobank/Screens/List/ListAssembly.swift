//
//  ListAssembly.swift
//  Rabobank
//
//  Created by Dennis Skokov on 22/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import UIKit

class ListAssembly {
    let presenter: ListPresenter
    let interactor: DefaultListInteractor
    
    init() {
        let source = BundleTextSource(resource: "issues", ofType: "csv")
        let parser = CSVTextParser()
        
        interactor = DefaultListInteractor(source: source, parser: parser)
        
        presenter = ListPresenter()
        presenter.interactor = interactor
        interactor.output = presenter
    }
}

extension ListAssembly: ViewControllerFactory {
    func createViewController() -> UIViewController {
        let viewController = initialControllerFromStoryboard() as! ListTableViewController
 
        presenter.view = viewController
        viewController.evensHandler = presenter
        interactor.errorHandler = viewController
        
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
    private func initialControllerFromStoryboard() -> UIViewController {
        let bundle = Bundle(for: type(of: self))
        let storyboard = UIStoryboard(name: "List", bundle: bundle)
        return storyboard.instantiateInitialViewController()!
    }
}
