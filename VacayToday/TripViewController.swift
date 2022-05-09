//
//  TripViewController.swift
//  VacayToday
//
//  Created by Maddie Tong on 5/4/22.
//

import UIKit

class TripViewController: UIViewController, UITabBarDelegate {
    
    @IBOutlet var timeLabel: UILabel!
    

    @IBOutlet var titleLabel: UILabel!
    
  
    
    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true);
    }
    
    @IBOutlet weak var tab: UITabBar!
    
    @IBOutlet weak var transportView: UIView!
    @IBOutlet weak var lodgingView: UIView!
    @IBOutlet weak var foodView: UIView!
    @IBOutlet weak var placesView: UIView!
    @IBOutlet weak var itineraryView: UIView!
    
    private var embeddedItinerary : ItineraryViewController!;
    private var embeddedPlaces : PlacesViewController!;
    private var embeddedFood : FoodViewController!;
    private var embeddedLodging : LodgingViewController!;
    private var embeddedTransport : TransportationViewController!;
    var modelController: ModelController!
    
    func parseDate2(date:String)->String{
        let dateFor: DateFormatter = DateFormatter(); dateFor.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
        let yourDate: NSDate? = dateFor.date(from: date) as NSDate?
        let dateFormatterPrint = DateFormatter();
        dateFormatterPrint.dateFormat = "MMMM dd, YYYY"
        let finaldate = dateFormatterPrint.string(from: yourDate! as Date);
      
        return finaldate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://vacaytoday.herokuapp.com/api/trip/mytrip/get/\(modelController.trip.tripId)")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { [self] (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

                 titleLabel.text = dataDictionary["name"] as? String
                 
                 if let startDate = dataDictionary["start_on"] as? String, let endDate = dataDictionary["end_on"] as? String {
                     let date1 = parseDate2(date: startDate) as! String
                     let date2 = parseDate2(date: endDate) as! String
                     timeLabel.text = date1+" - "+date2
                 }
                 
             }
            
            
                  
        }
        task.resume()
        
        tab.selectedItem = tab.items?[0]
        itineraryView.isHidden = false
        placesView.isHidden = true
        foodView.isHidden = true
        lodgingView.isHidden = true
        transportView.isHidden = true
        
        tab.delegate = self;
        // Do any additional setup after loading the view.
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
            case 1:
            
            itineraryView.isHidden = false
            placesView.isHidden = true
            foodView.isHidden = true
            lodgingView.isHidden = true
            transportView.isHidden = true
            embeddedItinerary.reloadData()
            break;
            
            case 2:
            
            itineraryView.isHidden = true
            placesView.isHidden = false
            foodView.isHidden = true
            lodgingView.isHidden = true
            transportView.isHidden = true
            
            break;
            
            case 3:
            
            itineraryView.isHidden = true
            placesView.isHidden = true
            foodView.isHidden = false
            lodgingView.isHidden = true
            transportView.isHidden = true
            
            break;
            
            case 4:
            
            itineraryView.isHidden = true
            placesView.isHidden = true
            foodView.isHidden = true
            lodgingView.isHidden = false
            transportView.isHidden = true
            
            break;

            default:
            
            itineraryView.isHidden = true
            placesView.isHidden = true
            foodView.isHidden = true
            lodgingView.isHidden = true
            transportView.isHidden = false
            
            break;
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! UINavigationController
        if segue.identifier == "itinerarySegue" {
            let vc = dest.topViewController as! ItineraryViewController
            self.embeddedItinerary = vc
            vc.modelController = modelController
        }
        
        if segue.identifier == "placesSegue" {
            let vc = dest.topViewController as! PlacesViewController
            self.embeddedPlaces = vc
            vc.modelController = modelController
        }
        
        if segue.identifier == "foodSegue" {
            let vc = dest.topViewController as! FoodViewController
            self.embeddedFood = vc
            vc.modelController = modelController
        }
        
        if segue.identifier == "lodgingSegue" {
            let vc = dest.topViewController as! LodgingViewController
            self.embeddedLodging = vc
            vc.modelController = modelController
        }
        
        if segue.identifier == "transportSegue" {
            let vc = dest.topViewController as! TransportationViewController
            self.embeddedTransport = vc
            vc.modelController = modelController
        }
    }
    

}
