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
    
    override func viewDidLoad() {
        print("in")
       
    }

        
   
    @IBAction func onLogIn(_ sender: Any) {
        let url = URL(string: "https://vacaytoday.herokuapp.com/api/auth/login")!
        // https://vacaytoday.herokuapp.com/api/user/getbyusername/atong
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
//
//                    self.movies = dataDictionary["results"] as![[String:Any]]
//
//
//                    self.tableView.reloadData()
//
                 if dataDictionary["statusCode"] as! Int == 200 {
                     performSegue(withIdentifier: "loginSegue", sender: nil)
                 }
                 
                 print(dataDictionary)
                 
                 
                 
                 
               
                     
                 
                    

                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data
             }
        }
        task.resume()

        
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
