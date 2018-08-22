//
//  UserCell.swift
//  TaskBuddy2
//
//  Created by Jonathan Compton on 8/22/18.
//  Copyright © 2018 Jonathan Compton. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var cellContainerView: UIView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        self.layer.cornerRadius = 10.0
        cellContainerView.backgroundColor = UIColor.black
        cellContainerView.layer.opacity = 0.8
        cellContainerView.layer.cornerRadius = 10.0
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
