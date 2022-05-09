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
    
    @IBOutlet var costLabel: UILabel!
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
    
    func subtractDate(fromDate:String, toDate:String) -> Int{
        
        
        let str = fromDate
        let str2 = toDate
        let dateFor: DateFormatter = DateFormatter()
        dateFor.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
        let yourDate: NSDate? = dateFor.date(from: str) as NSDate?
        let yourDate2: NSDate? = dateFor.date(from: str2) as NSDate?
        let calendar = NSCalendar.current
//        // Set time to 00:00
        let date1 = yourDate
        let date2 = yourDate2
        // Subtract the two dates
        let components = calendar.dateComponents([.day, .month, .year, .hour],from: date1 as! Date, to: date2 as! Date)
        
        print(components.hour!)

        
        
        return components.hour!
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        modeLabel.text = transportation["trans_mode"] as? String
        arrivalTimeLabel.text = parseDate2(date:transportation["act_to"] as! String) as! String
        departureTimeLabel.text = parseDate2(date:transportation["act_from"] as! String) as! String
        
        departureLocationArrival.text = transportation["location_name"] as? String
        arrivalLocationLabel.text = transportation["location_name"] as? String
        
        costLabel.text = String((transportation["expense"] as? Int)!)
        
        travelDurationLabel.text = String(subtractDate(fromDate: transportation["act_from"] as! String, toDate: transportation["act_to"] as! String)) + " hour"
        
        print(subtractDate(fromDate: "2013-10-13T19:16:00.000Z", toDate: "2013-10-14T04:16:00.000Z"))

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
