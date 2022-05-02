//
//  RegisterViewController.swift
//  VacayToday
//
//  Created by Parker Fairfield on 5/1/22.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var setUsernameField: UITextField!
    
    @IBOutlet weak var setPasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let url = URL(string: "https://vacaytoday.herokuapp.com/api/user/signup")!
        // https://vacaytoday.herokuapp.com/api/user/getbyusername/atong
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        request.httpMethod = "POST"
        // add headers for the request
          request.addValue("application/json", forHTTPHeaderField: "Content-Type") // change as per server requirements
          request.addValue("application/json", forHTTPHeaderField: "Accept")
        let parameters : [String: Any] = [
            "username":setUsernameField.text!,
            "password":setPasswordField.text!,
            "profile_image": ""
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
                 if dataDictionary["statusCode"] as! Int == 200 {
                     performSegue(withIdentifier: "signupSegue", sender: nil)
                 }

                   

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


