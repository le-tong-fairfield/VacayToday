//
//  ExploreTableViewCell.swift
//  VacayToday
//
//  Created by Parker Fairfield on 5/4/22.
//

import UIKit

class ExploreTableViewCell: UITableViewCell {

    @IBOutlet weak var exploreImage: UIImageView!
    
    @IBOutlet weak var likesNumberLabel: UILabel!
    
    @IBOutlet weak var exploreTitleLabel: UILabel!
    
    @IBOutlet weak var exploreDaysLabel: UILabel!
    
    @IBOutlet weak var exploreCostLabel: UILabel!
    
    @IBOutlet weak var explorePeopleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
