//
//  FoodDetailViewController.swift
//  VacayToday
//
//  Created by Parker Fairfield on 5/6/22.
//

import UIKit

class FoodDetailViewController: UIViewController {
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var reservationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var food: [String:Any]!
    
    func reservation(isBooked:Bool) -> String{
        if (isBooked){
            return ("Reserved")
        }
        else{
            return("No reservation")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        detailTitleLabel.text = food["act_title"] as? String
        addressLabel.text = food["location_address"] as? String
        descriptionLabel.text = food["act_description"]as? String
        reservationLabel.text = reservation(isBooked: (food["is_Booked"] != nil)) as? String

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
