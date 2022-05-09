//
//  LodgingTableViewCell.swift
//  VacayToday
//
//  Created by Parker Fairfield on 5/5/22.
//

import UIKit

class LodgingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lodgingView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
  
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
