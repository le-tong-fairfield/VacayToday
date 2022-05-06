//
//  LodgingViewController.swift
//  VacayToday
//
//  Created by Maddie Tong on 5/4/22.
//

import UIKit

class LodgingViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var lodgings = [[String:Any]]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 170;

        
        tableView.dataSource = self
        tableView.delegate = self
        
        print("lodging")
        let url = URL(string: "https://vacaytoday.herokuapp.com/api/trip/activities/get/8&3")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { [self] (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]

                    self.lodgings = dataDictionary as! [[String : Any]];
                

                    self.tableView.reloadData()

                    print(dataDictionary)

             }
                  
        }
        task.resume()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lodgings.count
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LodgingTableViewCell") as! LodgingTableViewCell
            
            
        let lodging = lodgings[indexPath.row]
        
        let title = lodging["act_title"] as! String
        let location = lodging["location_name"] as! String
        let dateLabel = parseDate(date:lodging["act_from"] as! String) as! String

        print(title+location+dateLabel)


        cell.titleLabel.text = title
        cell.locationLabel.text = location
        cell.dateLabel.text = dateLabel

        
            
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

