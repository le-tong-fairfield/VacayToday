//
//  LodgingDetailsViewController.swift
//  VacayToday
//
//  Created by Parker Fairfield on 5/6/22.
//

import UIKit

class LodgingDetailsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var checkInTimeLabel: UILabel!
    @IBOutlet weak var checkOutTimeLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet var costLabel: UILabel!
    
    var lodging: [String:Any]!
    
    func parseDate2(date:String)->String{
        let dateFor: DateFormatter = DateFormatter(); dateFor.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
        let yourDate: NSDate? = dateFor.date(from: date) as NSDate?
        let dateFormatterPrint = DateFormatter();
        dateFormatterPrint.dateFormat = "hh:mm a"
        let finaldate = dateFormatterPrint.string(from: yourDate! as Date);
        print(finaldate)
      
        return finaldate
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = lodging["act_title"] as? String
        addressLabel.text = lodging["location_address"] as? String
        phoneNumberLabel.text = lodging["location_contact"] as? String
        checkInTimeLabel.text = parseDate2(date:lodging["act_from"] as! String) as! String
        checkOutTimeLabel.text = parseDate2(date:lodging["act_to"] as! String) as! String
        linkLabel.text = lodging["thumb_url"] as? String
//        costLabel.text = String((lodging["expense"] as? Int)!)
        
        
       
    
        print(lodging["expense"])
        
        let cost = lodging["expense"] ?? 0
        print(cost)
        
        if cost is NSNull{
            costLabel.text = "0"
        }else{
            costLabel.text = String((lodging["expense"] as? Int)!)
        }

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
