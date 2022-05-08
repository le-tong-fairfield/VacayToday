//
//  PlacesDetailsViewController.swift
//  VacayToday
//
//  Created by Parker Fairfield on 5/6/22.
//

import UIKit

class PlacesDetailsViewController: UIViewController {


    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var detailView: UIImageView!
    
    var place: [String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(place["act_title"])
              

        detailTitleLabel.text = place["act_title"] as? String
        addressLabel.text = place["location_address"] as? String
        descriptionLabel.text = place["act_description"]as? String


      

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
