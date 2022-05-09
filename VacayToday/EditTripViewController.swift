//
//  EditTripViewController.swift
//  VacayToday
//
//  Created by Maddie Tong on 5/8/22.
//

import UIKit

class EditTripViewController: UIViewController {

    @IBOutlet weak var submitBtn: UIBarButtonItem!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var numPeopleField: UITextField!
    @IBOutlet weak var tripIntroField: UITextView!
    
    var vcFromFeed: FeedViewController!
    var vcFromManage: ManageTripViewController!
    var modelController: ModelController!
    var isPublishing: Bool!
    var tripInfo: [String: Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (vcFromManage == nil) {
            submitBtn.title = "Create"
        } else {
            if (isPublishing) {
                submitBtn.title = "Publish"
            } else {
                submitBtn.title = "Save"
            }
            let numPeople: Int = tripInfo["num_people"] as! Int
            titleField.text = tripInfo["name"] as? String
            tripIntroField.text = tripInfo["description"] as? String
            numPeopleField.text = String(numPeople)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if(vcFromFeed != nil) {
            vcFromFeed.getMyTrips()
            modelController.trip.tripId = 0
        }
        if(vcFromManage != nil){
            vcFromManage.getTripInfoAPI()
        }
    }
    
    func createTripAPI(parameters: [String: Any]) {
        let url = URL(string: "https://vacaytoday.herokuapp.com/api/trip/mytrips/create")!
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        request.httpMethod = "POST"
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
             } else if let _ = data {
                 self.dismiss(animated: true)
             }
        }
        task.resume()
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
                 self.dismiss(animated: true)
             }
        }
        task.resume()
    }
    
    
    @IBAction func onSubmit(_ sender: Any) {
        var parameters : [String: Any] = [
            "name": titleField.text!,
            "description": tripIntroField.text!,
            "num_people": numPeopleField.text!,
            "is_published": false,
            "created_by": modelController.user.userId,
        ]
        if(vcFromManage == nil) {
            createTripAPI(parameters: parameters)
        } else if (isPublishing) {
            parameters.updateValue(true, forKey: "is_published")
            updateTripAPI(parameters: parameters)
        } else {
            updateTripAPI(parameters: parameters)
        }
    }
    
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
