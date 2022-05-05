//
//  ExploreTableViewController.swift
//  VacayToday
//
//  Created by Parker Fairfield on 5/4/22.
//

import UIKit

class ExploreTableViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var trips = [[String:Any]]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 200
   

        
        tableView.dataSource = self
        tableView.delegate = self
        
        let url = URL(string: "https://vacaytoday.herokuapp.com/api/trip/mytrips/get/1")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { [self] (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                 
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]

                    self.trips = dataDictionary as![[String:Any]]
//
//
                    self.tableView.reloadData()

                    print(dataDictionary)

                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data
                 
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExploreTableViewCell") as! ExploreTableViewCell
        
        let trip = trips[indexPath.row]
        let title = trip["name"]
        
        let likesInt = trip["likes"] as! Int
        var likes = String(likesInt)
        
        let peopleInt = trip["num_people"] as! Int
        var people = String(peopleInt)
        
        cell.exploreTitleLabel.text = title as! String
        cell.likesNumberLabel.text = likes as! String
        cell.explorePeopleLabel.text = people as! String
        
        
        return cell
        
    
        
        
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
