//
//  WinnersCell.swift
//  U10QHost
//
//  Created by Farbod on 1/15/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import UIKit

class WinnersCell: UITableViewCell {
    @IBOutlet weak var lblWinnerName: UILabel!
    @IBOutlet weak var imgWinner: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
