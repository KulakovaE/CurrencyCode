//
//  RateTableViewCell.swift
//  CurrencyCode
//
//  Created by Elena Kulakova on 2019-12-27.
//  Copyright © 2019 Elena Kulakova. All rights reserved.
//

import UIKit

class RateTableViewCell: UITableViewCell {

    
    @IBOutlet weak var rateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
