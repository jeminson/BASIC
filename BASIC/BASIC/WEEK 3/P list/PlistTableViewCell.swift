//
//  PlistTableViewCell.swift
//  BASIC
//
//  Created by Je Min Son on 2018. 11. 1..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit

class PlistTableViewCell: UITableViewCell {

    @IBOutlet weak var firstnameLabel: UILabel!
    @IBOutlet weak var lastnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var zipcodeLabel: UILabel!
    @IBOutlet weak var phonenumberLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
