//
//  FeedViewController.swift
//  VacayToday
//
//  Created by Parker Fairfield on 4/25/22.
//

import UIKit

class FeedViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var modelController: ModelController!
    
    var trips = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let url = URL(string: "https://vacaytoday.herokuapp.com/api/trip/mytrips/get/1")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { [self] (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                 
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]

                    self.trips = dataDictionary as![[String:Any]]
//
//
                    self.collectionView.reloadData()

                    print(dataDictionary)

                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data
                 print(data)
             }
        }
        task.resume()

        print("logged\(modelController.user)")
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trips.count
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyTripGridCell", for: indexPath) as! MyTripGridCell
        
        let trip = trips[indexPath.item]
        let title = trip["name"]
//        let tripID = trip["trip_id"]
//        let image = trip["profile_image"]
        
        
        cell.titleLabel.text = title as! String
        
        
        
        
        
        
        
        return cell
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
