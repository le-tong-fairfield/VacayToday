//
//  TripViewController.swift
//  VacayToday
//
//  Created by Maddie Tong on 5/4/22.
//

import UIKit

class TripViewController: UIViewController, UITabBarDelegate {

    @IBOutlet weak var tab: UITabBar!
    
    @IBOutlet weak var transportView: UIView!
    @IBOutlet weak var lodgingView: UIView!
    @IBOutlet weak var foodView: UIView!
    @IBOutlet weak var placesView: UIView!
    @IBOutlet weak var itineraryView: UIView!
    
    private var embeddedItinerary : ItineraryViewController!;
    private var embeddedPlaces : PlacesViewController!;
    private var embeddedFood : FoodViewController!;
    private var embeddedLodging : LodgingViewController!;
    private var embeddedTransport : TransportationViewController!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tab.selectedItem = tab.items?[0]
        itineraryView.isHidden = false
        placesView.isHidden = true
        foodView.isHidden = true
        lodgingView.isHidden = true
        transportView.isHidden = true
        
        tab.delegate = self;
        // Do any additional setup after loading the view.
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
            case 1:
            
            itineraryView.isHidden = false
            placesView.isHidden = true
            foodView.isHidden = true
            lodgingView.isHidden = true
            transportView.isHidden = true
            embeddedItinerary.reloadData()
            break;
            
            case 2:
            
            itineraryView.isHidden = true
            placesView.isHidden = false
            foodView.isHidden = true
            lodgingView.isHidden = true
            transportView.isHidden = true
            
            break;
            
            case 3:
            
            itineraryView.isHidden = true
            placesView.isHidden = true
            foodView.isHidden = false
            lodgingView.isHidden = true
            transportView.isHidden = true
            
            break;
            
            case 4:
            
            itineraryView.isHidden = true
            placesView.isHidden = true
            foodView.isHidden = true
            lodgingView.isHidden = false
            transportView.isHidden = true
            
            break;

            default:
            
            itineraryView.isHidden = true
            placesView.isHidden = true
            foodView.isHidden = true
            lodgingView.isHidden = true
            transportView.isHidden = false
            
            break;
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! UINavigationController
        if segue.identifier == "itinerarySegue" {
            let vc = dest.topViewController as! ItineraryViewController
            self.embeddedItinerary = vc
        }
        
        if segue.identifier == "placesSegue" {
            let vc = dest.topViewController as! PlacesViewController
            self.embeddedPlaces = vc
        }
        
        if segue.identifier == "foodSegue" {
            let vc = dest.topViewController as! FoodViewController
            self.embeddedFood = vc
        }
        
        if segue.identifier == "lodgingSegue" {
            let vc = dest.topViewController as! LodgingViewController
            self.embeddedLodging = vc
        }
        
        if segue.identifier == "transportSegue" {
            let vc = dest.topViewController as! TransportationViewController
            self.embeddedTransport = vc
        }
    }
    

}
