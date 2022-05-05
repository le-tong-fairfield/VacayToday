//
//  TripDetailViewController.swift
//  VacayToday
//
//  Created by Maddie Tong on 5/4/22.
//

import UIKit

class ItineraryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // An array of dictionaries exists throughout the life time of the screen
        var movies = [[String:Any]]();

        
    @IBOutlet weak var movieTableView: UITableView!
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            movieTableView.rowHeight = 169;
            movieTableView.delegate = self;
            movieTableView.dataSource = self;
            let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
            let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
            let task = session.dataTask(with: request) { (data, response, error) in
                 // This will run when the network request returns
                 if let error = error {
                        print(error.localizedDescription)
                 } else if let data = data {
                        let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                        self.movies = dataDictionary["results"] as! [[String : Any]];
                        // Reload table view movies.count times!
                        self.movieTableView.reloadData();
                 }
            }
            task.resume()
        }
    
        func reloadData() {
            self.movieTableView.reloadData();
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return movies.count;
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            // Recycle cells when they are out of view
            let cell = UITableViewCell()
            let movie = movies[indexPath.row]; // get each movie
            let title = movie["title"] as! String; // get movie title from movie object
            
            cell.textLabel?.text = title;
            
            return cell;
        }
}
