//
//  PlacesViewController.swift
//  VacayToday
//
//  Created by Maddie Tong on 5/4/22.
//

import UIKit

class PlacesViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var places = [[String:Any]]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 169;

        
        tableView.dataSource = self
        tableView.delegate = self
        
        print("places")
        let url = URL(string: "https://vacaytoday.herokuapp.com/api/trip/activities/get/8&1")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { [self] (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]

                    self.places = dataDictionary as! [[String : Any]];
                

                    self.tableView.reloadData()

                    print(dataDictionary)

             }
                  
        }
        task.resume()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
        }
    
    func parseDate(date:String)->String{
        let dateFor: DateFormatter = DateFormatter(); dateFor.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
        let yourDate: NSDate? = dateFor.date(from: date) as NSDate?
        let dateFormatterPrint = DateFormatter();
        dateFormatterPrint.dateFormat = "MMMM dd, yyyy"
        let finaldate = dateFormatterPrint.string(from: yourDate! as Date);
        print(finaldate)
      
        return finaldate
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlacesTableViewCell") as! PlacesTableViewCell
            
            
        let place = places[indexPath.row]
        let title = place["act_title"] as! String
        
        let dateLabel = parseDate(date:place["act_from"] as! String) as! String
         
        
        cell.placesNameLabel.text = title
        cell.placesDateLabel.text = dateLabel
            
        return cell
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

