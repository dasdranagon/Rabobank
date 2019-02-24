//
//  ListAssembly.swift
//  Rabobank
//
//  Created by Dennis Skokov on 22/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import UIKit

class ListAssembly: Assembly {
    var wireframe: ListWireframe!
    var presenter: ListPresenter!
    
    func configure() {
        let navigator = dependencies.navigator
        
        presenter = ListPresenter()
        
        wireframe = ListWireframe(navigator: navigator)
        wireframe.viewControllerFactory = self
    }
}

extension ListAssembly: ViewControllerFactory {
    func createViewController() -> UIViewController {
        let viewController = initialControllerFromStoryboard() as! ListTableViewController
 
        presenter.view = viewController
        viewController.evensHandler = presenter
        
        return viewController
    }
}
