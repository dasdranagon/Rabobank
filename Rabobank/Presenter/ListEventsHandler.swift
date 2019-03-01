//
//  ListEventsHandler.swift
//  Rabobank
//
//  Created by Dennis Skokov on 22/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import Foundation

protocol ListEventsHandler: AnyObject {
    func ready()
    func refresh()
}
