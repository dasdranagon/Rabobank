//
//  BaseWireframe.swift
//  Rabobank
//
//  Created by Dennis Skokov on 22/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import Foundation

class BaseWireframe: Wireframe {
    weak var navigator: Navigator!
    weak var viewControllerFactory: ViewControllerFactory!
    
    var navigationMethod: NavigationMethod = .root
    
    init(navigator: Navigator) {
        self.navigator = navigator
    }
    
    func activate() {
        let viewController = viewControllerFactory.createViewController()
        navigator.present(viewController: viewController, navigationMethod: navigationMethod)
    }
    
    func deactivate() {}
}
