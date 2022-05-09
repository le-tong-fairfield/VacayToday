//
//  ManageTripViewController.swift
//  VacayToday
//
//  Created by Le Lan Khanh on 08/05/2022.
//

import UIKit

class ManageTripViewController: UIViewController {

    @IBOutlet weak var publishBtn: UIButton!
    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var tripLabel: UILabel!
    
    @IBOutlet weak var usersAdded: UITextField!
    
    var modelController: ModelController!
    var tripInfo: [String: Any]!
    var isPublished: Bool!
    var unpublishTitleColor: UIColor!
    var publishTitleColor: UIColor!
    var vcFromFeed: FeedViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        unpublishTitleColor = hexStringToUIColor(hex: "#CC7272")
        publishTitleColor = hexStringToUIColor(hex: "#282E64")
        getTripInfoAPI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        modelController.trip.tripId = 0
        vcFromFeed.getMyTrips()
    }
    
    func updateTripAPI(parameters: [String: Any]) {
        let url = URL(string: "https://vacaytoday.herokuapp.com/api/trip/mytrips/update/\(modelController.trip.tripId)")!
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        request.httpMethod = "PATCH"
        // add headers for the request
          request.addValue("application/json", forHTTPHeaderField: "Content-Type") // change as per server requirements
          request.addValue("application/json", forHTTPHeaderField: "Accept")
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
                 let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                 tripLabel.text = dataDictionary["name"] as? String
                 isPublished = dataDictionary["is_published"] as? Bool
                 tripInfo = dataDictionary
                 if(isPublished) {
                     publishBtn.setTitle("Unpublish this trip", for: .normal)
                     publishBtn.setTitleColor(unpublishTitleColor, for: .normal)
                 } else {
                     publishBtn.setTitle("Publish this trip", for: .normal)
                     publishBtn.setTitleColor(publishTitleColor, for: .normal)
                 }
             }
        }
        task.resume()
    }
    
    func getTripInfoAPI() {
        let url = URL(string: "https://vacaytoday.herokuapp.com/api/trip/mytrip/get/\(modelController.trip.tripId)")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { [self] (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                 
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    tripLabel.text = dataDictionary["name"] as? String
                    isPublished = dataDictionary["is_published"] as? Bool
                    tripInfo = dataDictionary
                     if(isPublished) {
                         publishBtn.setTitle("Unpublish this trip", for: .normal)
                         publishBtn.setTitleColor(unpublishTitleColor, for: .normal)
                     } else {
                         publishBtn.setTitle("Publish this trip", for: .normal)
                         publishBtn.setTitleColor(publishTitleColor, for: .normal)
                     }
             }
        }
        task.resume()
    }
    
    
    @IBAction func doneButton(_ sender: Any) {
        let userInput = usersAdded.text!
        let separator = CharacterSet(charactersIn: ",")
        // array of users added by trip creator
        let user = userInput.components(separatedBy: separator)
        
    }
    
    
    @IBAction func publishButton(_ sender: Any) {
        if(isPublished) {
            let params = [
                "is_published": false
            ]
            updateTripAPI(parameters: params)
        } else {
            performSegue(withIdentifier: "editSegue", sender: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? EditTripViewController {
            vc.modelController = modelController;
            vc.tripInfo = tripInfo;
            if let _ = sender as? Bool {
                vc.isPublishing = true
            } else {
                vc.isPublishing = false
            }
            vc.vcFromManage = self;
        }
    }
    
    // helper
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}
