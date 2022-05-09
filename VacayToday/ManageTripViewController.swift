//
//  ManageTripViewController.swift
//  VacayToday
//
//  Created by Le Lan Khanh on 08/05/2022.
//

import UIKit

class ManageTripViewController: UIViewController {

    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var tripLabel: UILabel!
    
    @IBOutlet weak var usersAdded: UITextField!
    
    var modelController: ModelController!
    
    override func viewWillDisappear(_ animated: Bool) {
        modelController.trip.tripId = 0
    }
    
    
    @IBAction func doneButton(_ sender: Any) {
        let userInput = usersAdded.text!
        let separator = CharacterSet(charactersIn: ",")
        // array of users added by trip creator
        let user = userInput.components(separatedBy: separator)
        
    }
    
    
    @IBAction func publishButton(_ sender: Any) {
    }
    
    
    @IBAction func deleteButton(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? EditTripViewController {
            vc.modelController = modelController;
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

}
