//
//  ChatCell.swift
//  U10QHost
//
//  Created by Farbod on 1/13/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {

    @IBOutlet weak var lblAvatar: UILabel!
    @IBOutlet weak var imgUserImage: UIImageView!
    @IBOutlet weak var lblUserComment: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        lblAvatar.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
