//
//  InfoCell.swift
//  U10QHost
//
//  Created by Farbod on 4/7/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {
    @IBOutlet weak var lblItemText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(text:String) {
        lblItemText.text = text
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
