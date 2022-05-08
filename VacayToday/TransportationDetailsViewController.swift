//
//  TransportationDetailsViewController.swift
//  VacayToday
//
//  Created by Parker Fairfield on 5/7/22.
//

import UIKit

class TransportationDetailsViewController: UIViewController {

    @IBOutlet weak var travelDurationLabel: UILabel!
    @IBOutlet weak var modeLabel: UILabel!
    @IBOutlet weak var arrivalTimeLabel: UILabel!
    @IBOutlet weak var departureTimeLabel: UILabel!
    @IBOutlet var costLabel: UIView!
    @IBOutlet weak var departureLocationArrival: UILabel!
    @IBOutlet weak var arrivalLocationLabel: UILabel!
    
    var transportation: [String:Any]!
    
    
    func parseDate2(date:String)->String{
        let dateFor: DateFormatter = DateFormatter(); dateFor.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
        let yourDate: NSDate? = dateFor.date(from: date) as NSDate?
        let dateFormatterPrint = DateFormatter();
        dateFormatterPrint.dateFormat = "hh:mm a 'on' MM/dd"
        let finaldate = dateFormatterPrint.string(from: yourDate! as Date);
        print(finaldate)
      
        return finaldate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        modeLabel.text = transportation["trans_mode"] as? String
        arrivalTimeLabel.text = parseDate2(date:transportation["act_to"] as! String) as! String
        departureTimeLabel.text = parseDate2(date:transportation["act_from"] as! String) as! String
        
        departureLocationArrival.text = transportation["location_name"] as? String
        arrivalLocationLabel.text = transportation["location_name"] as? String

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
