//
//  MyTripGridCell.swift
//  VacayToday
//
//  Created by Parker Fairfield on 5/4/22.
//

import UIKit

class MyTripGridCell: UICollectionViewCell {
    
    
    @IBOutlet weak var tripImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var onEditAction: ((Any) -> Void)?
    
    @IBAction func onEditTrip(_ sender: Any) {
        self.onEditAction?(sender)
    }
    
}
