//
//  ListTableViewCell.swift
//  Rabobank
//
//  Created by Dennis Skokov on 22/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var numberOfIssueLabel: UILabel!
    
    func update(listItem: ListDisplayItem) {
        nameLabel.text = listItem.fullName
        dateLabel.text = listItem.dateOfBirth
        numberOfIssueLabel.text = listItem.issueCount
    }
}
