//
//  TabBarController.swift
//  VacayToday
//
//  Created by Maddie Tong on 5/9/22.
//

import UIKit

class TabBarController: UITabBarController {
    var modelController: ModelController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setModelController(mc: ModelController) {
        self.modelController = mc
        let feedNav = self.viewControllers?[0] as? UINavigationController
        let exploreNav = self.viewControllers?[1] as? UINavigationController
        let profileNav = self.viewControllers?[2] as? UINavigationController
        
        let feed = feedNav?.topViewController as? FeedViewController
        let explore = exploreNav?.topViewController as? ExploreTabTableViewController
        let profile = profileNav?.topViewController as? ProfileViewController
        
        feed?.modelController = self.modelController
        explore?.modelController = self.modelController
        profile?.modelController = self.modelController
    }
    
    // TODO: Modify this function to catch which navigation controller is the destination and set modelController of its top vc. Make sure every navigation passes on modelController
    
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        if let vc = self.selectedViewController as? FeedViewController {
//            vc.modelController = modelController
//        } else if let vc = self.selectedViewController as? ExploreTabTableViewController {
//            vc.modelController = modelController
//        } else if let vc = self.selectedViewController as? ProfileViewController {
//            vc.modelController = modelController
//        }
//    }

}
