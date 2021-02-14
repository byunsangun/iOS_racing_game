//
//  playerTableViewCell.swift
//  Lab04
//
//  Created by 변상운 on 2020/10/18.
//  Copyright © 2020 sangun. All rights reserved.
//

import UIKit

class playerTableViewCell: UITableViewCell {

    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerLabTime: UILabel!
    @IBOutlet weak var playerScore: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
