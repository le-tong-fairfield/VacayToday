//
//  CreatePlaceViewController.swift
//  VacayToday
//
//  Created by Parker Fairfield on 5/9/22.
//

import UIKit

class CreatePlaceViewController: UIViewController {
    @IBOutlet var descriptionField: UITextField!
    
    @IBOutlet var destinationField: UITextField!
    
    @IBOutlet var noteField: UITextField!
    @IBOutlet var linkField: UITextField!
    @IBOutlet var expenseField: UITextField!
    @IBOutlet var reservationControl: UISegmentedControl!
    @IBOutlet var addressField: UITextField!
    
    @IBOutlet var timeStartPicker: UIDatePicker!
    
  
    @IBOutlet var timeEndPicker: UIDatePicker!
    
    
    var date1 = Date()
    var date1String = ""
    var date2 = Date()
    var date2String = ""
    var modelController: ModelController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, YYYY hh:mm:ss"
        
        date1String = dateFormatter.string(from:timeStartPicker.date)
        date2String = dateFormatter.string(from:timeEndPicker.date)
        // Do any additional setup after loading the view.
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
    
    @IBAction func timeStartChange(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, YYYY hh:mm:ss"
        
        date1String = dateFormatter.string(from:timeStartPicker.date)
    }
    
    
    @IBAction func timeEndChange(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, YYYY hh:mm:ss"
        
        date2String = dateFormatter.string(from:timeEndPicker.date)
    }
    
    @IBAction func onCreate(_ sender: Any) {if destinationField.text! == "" {
        
        print("error")
        
    }else if destinationField.text! == "" || Int(expenseField.text!) == nil{
        
        
      
        let url = URL(string: "https://vacaytoday.herokuapp.com/api/trip/activity/create/8&1")!
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        request.httpMethod = "POST"
        // add headers for the request
          request.addValue("application/json", forHTTPHeaderField: "Content-Type") // change as per server requirements
          request.addValue("application/json", forHTTPHeaderField: "Accept")
        let parameters : [String: Any] = [
            "act_title":destinationField.text!,
            "act_description":descriptionField.text!,
            "location_address":addressField.text!,
            "expense":0,
            "thumb_url":linkField.text!,
            "note":noteField.text!,
            "is_booked":translation(reservationControl),
            "act_from": date1String,
            "act_to": date2String
            
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
             } else if let _ = data {
                 self.dismiss(animated: true, completion: nil)
             }
        }
            
        
        task.resume()
        
    }else {
        
        let url = URL(string: "https://vacaytoday.herokuapp.com/api/trip/activity/create/8&1")!
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        request.httpMethod = "POST"
        // add headers for the request
          request.addValue("application/json", forHTTPHeaderField: "Content-Type") // change as per server requirements
          request.addValue("application/json", forHTTPHeaderField: "Accept")
        let parameters : [String: Any] = [
            "act_title":destinationField.text!,
            "act_description":descriptionField.text!,
            "location_address":addressField.text!,
            "expense":Int(expenseField.text!)!,
            "thumb_url":linkField.text!,
            "note":noteField.text!,
            "is_booked":translation(reservationControl),
            "act_from": date1String,
            "act_to": date2String
            
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
             } else if let _ = data {
                 self.dismiss(animated: true, completion: nil)
             }
        }
            
        
        task.resume()
        
    }
    
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

