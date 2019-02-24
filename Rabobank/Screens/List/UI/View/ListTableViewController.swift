//
//  ListTableViewController.swift
//  Rabobank
//
//  Created by Dennis Skokov on 22/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    enum Constants {
        static let itemCellReusableId = "ListTableViewCell"
        static let estimatedRowHeight = CGFloat(64.0)
    }
    
    weak var evensHandler: ListEventsHandler!

    private var itemsList: [ListDisplayItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refreshControl = UIRefreshControl(frame: CGRect.zero)
        refreshControl!.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = Constants.estimatedRowHeight
        
        evensHandler.ready()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.itemCellReusableId, for: indexPath) as! ListTableViewCell
        
        let item = itemsList[indexPath.row]
        cell.update(listItem: item)
        
        return cell
    }
}

extension ListTableViewController {
    @objc func refresh() {
        evensHandler.refresh()
    }
}

extension ListTableViewController: ListView {
    
    func update(items:[ListDisplayItem]) {
        itemsList = items
        tableView.reloadData()
    }
    
    func processing(show: Bool) {
        if show {
            tableView.refreshControl?.beginRefreshing()
        } else {
            tableView.refreshControl?.endRefreshing()
        }
    }
}

extension ListTableViewController: ErrorHandler {}
