//
//  ExploreTabTableViewCell.swift
//  VacayToday
//
//  Created by Parker Fairfield on 5/7/22.
//

import UIKit

class ExploreTabTableViewCell: UITableViewCell {

   
    
    @IBOutlet var explorePeopleLabel: UILabel!
    @IBOutlet var exploreImage: UIImageView!
    
    @IBOutlet var exploreCostLabel: UILabel!
    @IBOutlet var exploreDaysLabel: UILabel!
    @IBOutlet var likeNumberLabel: UILabel!
    @IBOutlet var exploreTitleLabel: UILabel!
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
