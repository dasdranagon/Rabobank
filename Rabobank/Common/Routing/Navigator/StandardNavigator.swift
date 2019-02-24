//
//  StandardNavigator.swift
//  Rabobank
//
//  Created by Dennis Skokov on 22/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import UIKit

class StandardNavigator: Navigator {
    private var window: UIWindow!
    private var rootNavigationController: UINavigationController?
    
    func configure(window: UIWindow) {
        self.window = window
    }
    
    func present(viewController: UIViewController, navigationMethod: NavigationMethod) {
        switch navigationMethod {
        case .root: showAsRoot(viewController: viewController)
        case .push: push(viewController: viewController)
        }
    }
    
    func dismiss() {
        rootNavigationController?.popViewController(animated: true)
    }
}

extension StandardNavigator {
    private func showAsRoot(viewController: UIViewController) {
        rootNavigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = rootNavigationController
    }
    
    private func push(viewController: UIViewController) {
        rootNavigationController?.pushViewController(viewController, animated: true)
    }
}
