//
//  CategoryViewController.swift
//  VacayToday
//
//  Created by Parker Fairfield on 5/8/22.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    var modelController: ModelController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // Get a reference to the second view controller
        if let vc = segue.destination as? CreateLodgingViewController {
            vc.modelController = modelController
        } else if let vc = segue.destination as? CreateTransportationViewController {
            vc.modelController = modelController
        } else if let vc = segue.destination as? CreatePlaceViewController {
            vc.modelController = modelController
        } else if let vc = segue.destination as? CreateActivityViewController {
            vc.modelController = modelController
        }

    }

}
