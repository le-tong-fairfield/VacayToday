//
//  EditTripViewController.swift
//  VacayToday
//
//  Created by Maddie Tong on 5/8/22.
//

import UIKit

class EditTripViewController: UIViewController {

    @IBOutlet weak var submitBtn: UIBarButtonItem!
    
    @IBAction func onSubmit(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var numPeopleField: UITextField!
    
    
    @IBOutlet weak var tripIntroField: UITextView!
    
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: add real condition
        if (true) {
            submitBtn.title = "Publish"
        } else {
            submitBtn.title = "Save"
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
