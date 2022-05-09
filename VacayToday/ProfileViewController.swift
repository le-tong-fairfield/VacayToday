//
//  ProfileViewController.swift
//  VacayToday
//
//  Created by Le Lan Khanh on 08/05/2022.
//

import UIKit

class ProfileViewController: UIViewController {
    var modelController: ModelController!
    let defaults = UserDefaults.standard

    @IBOutlet weak var userName: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        getUserInfoAPI()
    }
    
    func getUserInfoAPI() {
        let url = URL(string: "https://vacaytoday.herokuapp.com/api/user/getbyid/\(modelController.user.userId)")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { [self] (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                 
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                 userName.text = dataDictionary["username"] as? String
             }
        }
        task.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let _ = segue.destination as? LoginViewController {
            defaults.removeObject(forKey: "user")
            modelController = ModelController()
        }
    }

}
