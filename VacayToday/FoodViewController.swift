//
//  FoodViewController.swift
//  VacayToday
//
//  Created by Maddie Tong on 5/4/22.
//

import UIKit

class FoodViewController: UIViewController, UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    var foods = [[String:Any]]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 150;

        
        tableView.dataSource = self
        tableView.delegate = self
        
        print("foods")
        let url = URL(string: "https://vacaytoday.herokuapp.com/api/trip/activities/get/8&2")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { [self] (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]

                    self.foods = dataDictionary as! [[String : Any]];
                

                    self.tableView.reloadData()

                    print(dataDictionary)

             }
                  
        }
        task.resume()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
        }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTableViewCell") as! FoodTableViewCell
            
            
        let food = foods[indexPath.row]
        
        let title = food["act_title"] as! String
        let ratingNumber = food["rating"] as! Int
        var rating = String(ratingNumber)
        
        let recommendation = food["recommendation"] as! String
        
        cell.titleLabel.text = title
        cell.ratingLabel.text = rating
        cell.recommendationLabel.text = recommendation

       
            
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

