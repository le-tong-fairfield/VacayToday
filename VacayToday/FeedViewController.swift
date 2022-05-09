//
//  FeedViewController.swift
//  VacayToday
//
//  Created by Parker Fairfield on 4/25/22.
//

// TODO: Willappear instead of viewDidLoad in order to reload

import UIKit

class FeedViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var modelController: ModelController!
    
    var trips = [[String:Any]]()
    var onEditAction: ((Any) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        print(modelController.user)
        getMyTrips()
    }
    
    func getMyTrips() {
        let url = URL(string: "https://vacaytoday.herokuapp.com/api/trip/mytrips/get/\(modelController.user.userId)")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { [self] (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                 
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]

                    self.trips = dataDictionary as![[String:Any]]
                    self.collectionView.reloadData()
             }
        }
        task.resume()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trips.count
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyTripGridCell", for: indexPath) as! MyTripGridCell
        
        let trip = trips[indexPath.item]
        let title = trip["name"]
        let tripId = trip["trip_id"]
//        let tripID = trip["trip_id"]
//        let image = trip["profile_image"]
        
        cell.onEditAction = { sender in
            self.modelController.trip.tripId = tripId as! Int
            self.performSegue(withIdentifier: "editSegue", sender: nil)
        }
        cell.titleLabel.text = title as! String

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? EditTripViewController {
            vc.modelController = modelController;
            vc.vcFromFeed = self
        } else if let vc = segue.destination as? ManageTripViewController {
            vc.modelController = modelController;
            vc.vcFromFeed = self
        } else if let vc = segue.destination as? TripViewController {
            let cell = sender as! UICollectionViewCell;
            let indexPath = collectionView.indexPath(for: cell)!;
            let trip = trips[indexPath.row];
            modelController.trip.tripId = trip["trip_id"]! as! Int
            modelController.trip.fromExplore = false
            vc.modelController = modelController;
        }
    }

}
