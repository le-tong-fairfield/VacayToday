//
//  CategoryViewController.swift
//  VacayToday
//
//  Created by Parker Fairfield on 5/8/22.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   

    @IBAction func onFood(_ sender: Any) {
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {

               // Get a reference to the second view controller
               let CreateActivityViewController = segue.destination as! CreateActivityViewController
           
               

               // Set a variable in the second view controller with the String to pass
            
            
           }
    }
    
    @IBAction func onLodging(_ sender: Any) {
        
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
               // Get a reference to the second view controller
               let CreateLodgingViewController = segue.destination as! CreateLodgingViewController
           
               

               // Set a variable in the second view controller with the String to pass
              
//
           }
    }
    
}
