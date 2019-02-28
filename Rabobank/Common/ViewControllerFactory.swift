//
//  ViewControllerFactory.swift
//  Rabobank
//
//  Created by Dennis Skokov on 22/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import UIKit

protocol ViewControllerFactory: AnyObject {
    func createViewController() -> UIViewController
}
