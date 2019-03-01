//
//  ListDataSource.swift
//  Rabobank
//
//  Created by Dennis Skokov on 24/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

protocol ListDataSource: AnyObject {
    func fetch()
}

protocol ListDataSourceOutput: AnyObject {
    func update(items:[Person])
}
