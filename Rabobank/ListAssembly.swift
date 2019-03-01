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
    let dataSource: DefaultListDataSource
    
    init() {
        let source = BundleTextSource(resource: "issues", ofType: "csv")
        let parser = CSVTextParser()
        
        dataSource = DefaultListDataSource(source: source, parser: parser)
        
        presenter = ListPresenter()
        presenter.dataSource = dataSource
        dataSource.output = presenter
    }
}

// MARK: create ViewController
extension ListAssembly {
    func createViewController() -> UIViewController {
        let viewController = initialControllerFromStoryboard() as! ListTableViewController
 
        presenter.view = viewController
        viewController.evensHandler = presenter
        dataSource.errorHandler = viewController
        
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
    private func initialControllerFromStoryboard() -> UIViewController {
        let bundle = Bundle(for: type(of: self))
        let storyboard = UIStoryboard(name: "List", bundle: bundle)
        return storyboard.instantiateInitialViewController()!
    }
}
