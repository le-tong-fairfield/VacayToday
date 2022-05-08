//
//  ActTableViewCell.swift
//  VacayToday
//
//  Created by Maddie Tong on 5/7/22.
//

import UIKit

class ActTableViewCell: UITableViewCell {
    
    @IBOutlet weak var timeToLabel: UILabel!
    @IBOutlet weak var expense: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
