//
//  TransportationTableViewCell.swift
//  VacayToday
//
//  Created by Parker Fairfield on 5/6/22.
//

import UIKit

class TransportationTableViewCell: UITableViewCell {

    
    @IBOutlet weak var dateToLabel: UILabel!
    @IBOutlet weak var locationToLabel: UILabel!
  
    @IBOutlet var costLabel: UILabel!
    @IBOutlet weak var dateFromLabel: UILabel!
    @IBOutlet weak var locationFromLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var modeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
