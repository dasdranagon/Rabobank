//
//  Navigator.swift
//  Rabobank
//
//  Created by Dennis Skokov on 22/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import UIKit

enum NavigationMethod {
    case push
    case root
}

protocol Navigator: AnyObject {
    func present(viewController: UIViewController, navigationMethod: NavigationMethod)
    func dusmiss()
}
