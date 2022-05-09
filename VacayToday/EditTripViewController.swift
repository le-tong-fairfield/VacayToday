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
    
    var vc: FeedViewController!
    var modelController: ModelController!
    var isPublishing: Bool!
    var tripId: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tripId = modelController.trip.tripId
        if (tripId == 0) {
            submitBtn.title = "Create"
        } else if (isPublishing) {
            submitBtn.title = "Publish"
        } else {
            submitBtn.title = "Save"
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        vc.getMyTrips()
    }
    
    func createTripAPI() {
        let url = URL(string: "https://vacaytoday.herokuapp.com/api/trip/mytrips/create")!
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        request.httpMethod = "POST"
        // add headers for the request
          request.addValue("application/json", forHTTPHeaderField: "Content-Type") // change as per server requirements
          request.addValue("application/json", forHTTPHeaderField: "Accept")
        let parameters : [String: Any] = [
            "name": titleField.text!,
            "description": tripIntroField.text!,
            "start_on": "",
            "end_on": "",
            "num_people": numPeopleField.text!,
            "likes": 0,
            "is_published": false,
            "created_by": modelController.user.userId,
            "thumb_url": ""
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
                 print(dataDictionary)
             }
        }
        task.resume()
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        if(tripId == 0) {
            createTripAPI()
        }
        self.dismiss(animated: true)
    }
    
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
