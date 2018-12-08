//
//  MeasurableCell.swift
//  gymTracker
//
//  Created by Jake Mobile Dev on 27/11/18.
//  Copyright © 2018 JakeMobileDev. All rights reserved.
//

import UIKit

class MeasurableCell: UITableViewCell {

    @IBOutlet weak var measurableNameCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func populate(with measurable: Measurement<Unit>) {
        
    }
}
