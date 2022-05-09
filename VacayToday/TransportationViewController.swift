//
//  TransportationViewController.swift
//  VacayToday
//
//  Created by Maddie Tong on 5/4/22.
//

import UIKit

class TransportationViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var transportations = [[String:Any]]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 150;

        
        tableView.dataSource = self
        tableView.delegate = self
        
        print("transportation")
        let url = URL(string: "https://vacaytoday.herokuapp.com/api/trip/activities/get/8&4")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { [self] (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]

                    self.transportations = dataDictionary as! [[String : Any]];
                

                    self.tableView.reloadData()

                    print(dataDictionary)

             }
                  
        }
        task.resume()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transportations.count
        }
    func parseDate(date:String)->String{
        let dateFor: DateFormatter = DateFormatter(); dateFor.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
        let yourDate: NSDate? = dateFor.date(from: date) as NSDate?
        let dateFormatterPrint = DateFormatter();
        dateFormatterPrint.dateFormat = "MM/dd/yy"
        let finaldate = dateFormatterPrint.string(from: yourDate! as Date);
        print(finaldate)
      
        return finaldate
    }
   
    func parseDate2(date:String)->String{
        let dateFor: DateFormatter = DateFormatter(); dateFor.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
        let yourDate: NSDate? = dateFor.date(from: date) as NSDate?
        let dateFormatterPrint = DateFormatter();
        dateFormatterPrint.dateFormat = "hh:mm a"
        let finaldate = dateFormatterPrint.string(from: yourDate! as Date);
        print(finaldate)
      
        return finaldate
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransportationTableViewCell") as! TransportationTableViewCell
            
            
        let transportation = transportations[indexPath.row]
        
        
//        if transportation["expense"]  == NSNull{
//            let costLabel = "0"
//        }else{
//            let costLabel = transportation["expense"] as! String
//        }
        
     
        
        let dateToLabel = parseDate2(date:transportation["act_to"] as! String) as! String
        let locationToLabel = transportation["location_address"] as! String
        let dateFromLabel = parseDate2(date:transportation["act_from"] as! String) as! String
        let locationFromLabel = transportation["location_address"] as! String
        let dateLabel = parseDate(date:transportation["act_from"] as! String) as! String
        let modeLabel = transportation["trans_mode"] as? String
        let costLabel = transportation["expense"] ?? 0
        
        
        
        
    
        print(transportation["expense"])
        
        let cost = transportation["expense"] ?? 0
        print(cost)
        
        if cost is NSNull{
            cell.costLabel.text = "0"
        }else{
            cell.costLabel.text = String((costLabel as? Int)!)
        }
        
        cell.dateToLabel.text = dateToLabel
        cell.dateFromLabel.text = dateFromLabel
        cell.locationToLabel.text = locationToLabel
        cell.locationFromLabel.text = locationFromLabel
        cell.dateLabel.text = dateLabel
        cell.modeLabel.text = modeLabel
//        cell.costLabel.text = costLabel as! String
        
        
     

        
            
        return cell
        }
        

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        print("Loading")
        
        
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        
        let transportation = transportations[indexPath.row]
        
        let detailsViewController = segue.destination as! TransportationDetailsViewController
        
        detailsViewController.transportation = transportation
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
        
    }
}

