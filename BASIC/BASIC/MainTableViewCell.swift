//
//  MainTableViewCell.swift
//  BASIC
//
//  Created by Je Min Son on 2018. 11. 4..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit

class WeekOneTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
