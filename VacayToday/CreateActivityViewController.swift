//
//  CreateActivityViewController.swift
//  VacayToday
//
//  Created by Parker Fairfield on 5/8/22.
//

import UIKit

class CreateActivityViewController: UIViewController {

    @IBOutlet var recommendationField: UITextField!
    @IBOutlet var expenseField: UITextField!
    @IBOutlet var reservationControl: UISegmentedControl!
    @IBOutlet var addressField: UITextField!
    @IBOutlet var timeEndField: UITextField!
    @IBOutlet var timeStartField: UITextField!
    @IBOutlet var restaurantField: UITextField!
    @IBOutlet var descriptionField: UITextField!
    @IBOutlet weak var titleLable: UILabel!
    
    var titleField = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLable.text = titleField
    }
    
    func translation(_ sender: UISegmentedControl) -> Bool
    {
        
        var reservation = true
        
        if sender.selectedSegmentIndex == 0
        {
            reservation = true
        }
        else if reservationControl.selectedSegmentIndex == 1
        {
            reservation = false
        }
        return reservation
    }
    
    @IBAction func onCreate(_ sender: Any) {
        let url = URL(string: "https://vacaytoday.herokuapp.com/api/trip/activity/create/8&1")!
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        request.httpMethod = "POST"
        // add headers for the request
          request.addValue("application/json", forHTTPHeaderField: "Content-Type") // change as per server requirements
          request.addValue("application/json", forHTTPHeaderField: "Accept")
        let parameters : [String: Any] = [
            "act_title":restaurantField.text!,
            "act_description":descriptionField.text!,
            "location_address":addressField.text!,
            "expense":expenseField.text!,
            "recommendation":recommendationField.text!,
            "is_booked":translation(reservationControl),
            "act_from":timeStartField.text!,
            "act_to":timeEndField.text!,
            
        ]
        do {
            // convert parameters to Data and assign dictionary to httpBody of request
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
          } catch let error {
            print(error.localizedDescription)
            return
          }
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { [self] (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
//
//                    self.movies = dataDictionary["results"] as![[String:Any]]
//
//
//                    self.tableView.reloadData()
//
                 
                 print(parameters)
             }
        }
        task.resume()

        
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


