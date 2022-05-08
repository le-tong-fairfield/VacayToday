//
//  TripDetailViewController.swift
//  VacayToday
//
//  Created by Maddie Tong on 5/4/22.
//

// TODO: getdates should be the original string due to timezone in FE

import UIKit

class ItineraryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    

    // An array of dictionaries exists throughout the life time of the screen
    var acts = [[String:Any]]();
    var selectedDate: String?
    var dateList = [String]()
    
    let dateFor: DateFormatter = DateFormatter() // JSON date
    let dateForSelectPrint: DateFormatter = DateFormatter() // MMMM dd, yyyy
    let dateFormatterPrint = DateFormatter() // (MM/dd)
    let timeFormatterPrint = DateFormatter() // time AM/PM
    let dateForPrint = DateFormatter() // yyyy-MM-dd

    
    @IBOutlet weak var actTableView: UITableView!
    
    @IBOutlet weak var dateText: UITextField!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            createPickerView()
            dismissPickerView()
            dateText.delegate = self
            
            actTableView.rowHeight = 125;
            actTableView.delegate = self;
            actTableView.dataSource = self;
            
            dateFor.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
            dateForSelectPrint.dateFormat = "MMMM dd, yyyy"
            dateFormatterPrint.dateFormat = "(MM/dd)"
            timeFormatterPrint.dateFormat = "h:mm a"
            timeFormatterPrint.amSymbol = "AM"
            timeFormatterPrint.pmSymbol = "PM"
            dateForPrint.dateFormat = "yyyy-MM-dd"
            
            getAPI(endpoint: "https://vacaytoday.herokuapp.com/api/trip/activities/get/8", isGettingActs: true)
            getAPI(endpoint: "https://vacaytoday.herokuapp.com/api/trip/activities/getdates/8", isGettingActs: false)
            
        }
    
    func getAPI (endpoint: String, isGettingActs: Bool) {
        print(endpoint)
        let url = URL(string: endpoint)!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                 if (isGettingActs) {
                     let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]
                     self.acts = dataDictionary
                     self.actTableView.reloadData()
                 } else {
                     let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String]
                     self.dateList = dataDictionary
                 }
             }
        }
        task.resume()
    }
    
        func reloadData() {
            self.actTableView.reloadData();
        }
    
    func getCatIcon(catId:Int) -> String {
        switch(catId){
        case 1:
            return "building.columns"
        case 2:
            return "fork.knife"
        case 3:
            return "bed.double"
        case 4:
            return "airplane"
        default:
            return "face.smiling"
        }
    }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return acts.count;
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            // Recycle cells when they are out of view
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActTableViewCell") as! ActTableViewCell;
            let act = acts[indexPath.row]; // get each movie
            let title = act["act_title"] as! String; // get movie title from movie object
            let address = act["location_address"] as? String; // get movie title from movie object
            
            let timeFrom = act["act_from"] as! String
            let timeTo = act["act_to"] as! String
            let catId = act["category"]
            
            let systemIcon: String = getCatIcon(catId: catId as! Int);

            let yourDateFrom: NSDate? = dateFor.date(from: timeFrom) as NSDate?
            let yourDateTo: NSDate? = dateFor.date(from: timeTo) as NSDate?
            
            if (indexPath.row == 0) {
                let yourSelectedDate :NSDate? = dateFor.date(from: timeFrom) as NSDate?
                let finaldateSelected = dateForSelectPrint.string(from: yourSelectedDate! as Date)
                selectedDate = finaldateSelected;
                dateText.text = selectedDate
            }
            

            let finalTimeFrom = timeFormatterPrint.string(from: yourDateFrom! as Date)
            var finalTimeTo = timeFormatterPrint.string(from: yourDateTo! as Date)
            
            
            let finalDateFrom = dateFormatterPrint.string(from: yourDateFrom! as Date)
            let finalDateTo = dateFormatterPrint.string(from: yourDateTo! as Date)
            
            if (finalDateFrom != finalDateTo) {
                finalTimeTo = finalTimeTo + " " + finalDateTo
            }
            
            cell.timeLabel.text = finalTimeFrom
            cell.timeToLabel.text = finalTimeTo
            cell.title.text = title
            cell.address.text = address

            cell.icon.image = UIImage(systemName: systemIcon)?.withTintColor(.darkGray, renderingMode: .alwaysOriginal)
            return cell;
        }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dateList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let yourDate: NSDate? = dateForPrint.date(from: dateList[row]) as NSDate?
        let finaldateSelected = dateForSelectPrint.string(from: yourDate! as Date)
        return finaldateSelected
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let yourDate: NSDate? = dateForPrint.date(from: dateList[row]) as NSDate?
        let finaldateSelected = dateForSelectPrint.string(from: yourDate! as Date)
        selectedDate = finaldateSelected // selected item
        dateText.text = selectedDate
    }
    
    func createPickerView() {
           let pickerView = UIPickerView()
           pickerView.delegate = self
            pickerView.dataSource = self
        dateText.inputView = pickerView
    }
    func dismissPickerView() {
       let toolBar = UIToolbar()
       toolBar.sizeToFit()
       let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
       toolBar.setItems([button], animated: true)
       toolBar.isUserInteractionEnabled = true
        dateText.inputAccessoryView = toolBar
    }
    @objc func action() {
          view.endEditing(true)
        let encoded = selectedDate!.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let end =  "https://vacaytoday.herokuapp.com/api/trip/activities/getbydate/8&\(encoded)"
        getAPI(endpoint: end, isGettingActs: true)
    }
    
    // Disallow typing in text field
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    
}
