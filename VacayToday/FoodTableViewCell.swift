//
//  FoodTableViewCell.swift
//  VacayToday
//
//  Created by Parker Fairfield on 5/5/22.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var foodView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var recommendationLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
