//
//  TableViewCell.swift
//  TableViewWithRxSwift
//
//  Created by Akshay Nandane on 25/05/21.
//  Copyright © 2021 com.app.connectme. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
