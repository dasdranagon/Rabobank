//
//  ListView.swift
//  Rabobank
//
//  Created by Dennis Skokov on 22/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import Foundation

protocol ListView: AnyObject {
    func update(items:[ListDisplayItem])
    func processing(show: Bool)
}
