//
//  PlacesTableViewCell.swift
//  VacayToday
//
//  Created by Parker Fairfield on 5/5/22.
//

import UIKit

class PlacesTableViewCell: UITableViewCell {

    @IBOutlet weak var placesView: UIImageView!
    @IBOutlet weak var placesNameLabel: UILabel!
    @IBOutlet weak var placesDateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
