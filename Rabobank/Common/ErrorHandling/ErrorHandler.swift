//
//  ErrorHandler.swift
//  Rabobank
//
//  Created by Dennis Skokov on 24/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import UIKit

protocol ErrorHandler: AnyObject {
    func proceed(error: Error)
}

extension ErrorHandler where Self: UIViewController {
    func proceed(error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
