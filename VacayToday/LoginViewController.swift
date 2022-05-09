//
//  LoginViewController.swift
//  VacayToday
//
//  Created by Parker Fairfield on 4/25/22.
//

import UIKit


class LoginViewController: UIViewController {

    
    
    
    @IBOutlet weak var usernameField: UITextField!
 
    
    @IBOutlet weak var passwordField: UITextField!
    
    var modelController: ModelController!
    let defaults = UserDefaults.standard
        
    override func viewDidLoad() {
        modelController = ModelController()
    }

   
    @IBAction func onLogIn(_ sender: Any) {
        let url = URL(string: "https://vacaytoday.herokuapp.com/api/auth/login")!
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        request.httpMethod = "POST"
        // add headers for the request
          request.addValue("application/json", forHTTPHeaderField: "Content-Type") // change as per server requirements
          request.addValue("application/json", forHTTPHeaderField: "Accept")
        let parameters : [String: Any] = [
            "username":usernameField.text!,
            "password":passwordField.text!
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
                 if dataDictionary["statusCode"] as! Int == 200 {
                     let userId = dataDictionary["user_id"] as! Int
                     let username = dataDictionary["username"] as! String
                     modelController.user = User(userId: userId, username: username)
                     let encoder = JSONEncoder()
                     if let encodedUser = try? encoder.encode(modelController.user) {
                         defaults.set(encodedUser, forKey: "user")
                         performSegue(withIdentifier: "loginSegue", sender: nil)
                     }
                 }
             }
        }
        task.resume()

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // To access the child view of UINavigationController, we need this intermediate line
        if let tab = segue.destination as? TabBarController {
            tab.setModelController(mc: modelController)
        }
    }

}
