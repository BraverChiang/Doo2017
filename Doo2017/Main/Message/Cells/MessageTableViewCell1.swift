//
//  MessageTableViewCell1.swift
//  Doo2017
//
//  Created by Braver Chiang on 11/16/17.
//  Copyright © 2017 Braver Chiang. All rights reserved.
//

import UIKit

class MessageTableViewCell1: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
