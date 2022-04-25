//
//  Model.swift
//  VacayToday
//
//  Created by Le Lan Khanh on 24/04/2022.
//

import Foundation

struct Places : Identifiable {
    
    var id : Int
    var name : String
    var image : String
    var date : String
}

var data = [
    Places(id:0, name: "Bonsai Museum", image: "bonsai", date: "Mar 15, 2022"),
    Places(id:1, name: "Eden Center", image: "eden", date: "Mar 14, 2022"),
    Places(id:2, name: "National Museum", image: "museum", date: "Mar 13, 2022"),
    Places(id:3, name: "Washington Monument", image: "monument", date: "Mar 10, 2022")]

struct Lodging : Identifiable {
    var id : Int
    var name : String
    var image : String
    var location : String
    var date : String
}

var lodgingData = [
    Lodging(id:0, name: "Prince Hotels & Resorts", image: "hotel", location: "San Francisco, CA", date: "Mar 15,2022"),
    Lodging(id:1, name: "Holiday Inn", image: "inn", location: "San Francisco, CA", date: "Mar 14,2022")]

struct Itineraries : Identifiable {
    var id : Int
    var activity : String
    var time : String
    var description : String
}

var itineraryData = [
    Itineraries(id: 0, activity: "Car Travel", time: "8:30 AM", description: "Airbnb - Pho 14"),
    Itineraries(id: 1, activity: "Eating", time: "9:30 AM", description: "Banh cuon @ Eden Center"),
    Itineraries(id: 2, activity: "Outdoor", time: "11:00 AM", description: "Sightseeing @ Bonsai Museum"),
    Itineraries(id: 3, activity: "Visiting Friends", time: "2:00 PM", description: "Gathering @ Union Station")]


