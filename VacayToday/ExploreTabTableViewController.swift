//
//  ExploreTabTableViewController.swift
//  VacayToday
//
//  Created by Parker Fairfield on 5/7/22.
//

import UIKit

class ExploreTabTableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    
    @IBOutlet var tableView: UITableView!
    
    
    var trips = [[String:Any]]()
    var modelController: ModelController!
    var dateFor: DateFormatter!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 210
        tableView.dataSource = self
        tableView.delegate = self
        
        dateFor = DateFormatter()
        dateFor.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
        
        let url = URL(string: "https://vacaytoday.herokuapp.com/api/trip/explores/get")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { [self] (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                 
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]

                 self.trips = dataDictionary
                    self.tableView.reloadData()
                 
             }
        }
        task.resume()

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int)-> Int{
        return trips.count
    }
        // #warning Incomplete implementation, return the number of sections
      
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath ) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExploreTabTableViewCell") as! ExploreTabTableViewCell
        
        let trip = trips[indexPath.row]
        let title = trip["name"]
        
        let likesInt = trip["likes"] as! Int
        let likes = String(likesInt)
        
        let peopleInt = trip["num_people"] as! Int
        let people = String(peopleInt)
        
        var numDays = 0
        
        if let startStr = trip["start_on"] as? String, let endStr = trip["end_on"] as? String {
            let startDate: NSDate? = dateFor.date(from: startStr) as NSDate?
            let endDate: NSDate? = dateFor.date(from: endStr) as NSDate?

            let calendar = NSCalendar.current
            // Set time to 00:00
            let date1 = calendar.startOfDay(for: startDate! as Date)
            let date2 = calendar.startOfDay(for: endDate! as Date)

            // Subtract the two dates
            let components = calendar.dateComponents([.day, .month, .year, .hour], from: date1, to: date2)
            numDays = components.day!
        }
        
        cell.exploreDaysLabel.text = String(numDays) + " days"
        cell.exploreTitleLabel.text = title as? String
        cell.likeNumberLabel.text = likes
        cell.explorePeopleLabel.text = people + " people"
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TripViewController {
            let cell = sender as! UITableViewCell;
            let indexPath = tableView.indexPath(for: cell)!;
            let trip = trips[indexPath.row];
            modelController.trip.tripId = trip["trip_id"]! as! Int
            modelController.trip.fromExplore = true
            vc.modelController = modelController;
        }
    }
}
