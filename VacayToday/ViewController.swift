//
//  ViewController.swift
//  VacayToday
//
//  Created by Le Lan Khanh on 18/04/2022.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBSegueAction func addSwiftUIView(_ coder: NSCoder) -> UIViewController? {
        let hostingController = UIHostingController(coder: coder, rootView: ContentView())
        hostingController!.view.backgroundColor = UIColor.clear
        return hostingController
    }
    
}

