//
//  ModelController.swift
//  VacayToday
//
//  Created by Maddie Tong on 5/4/22.
//

import Foundation

struct User: Codable {
    let userId: Int
    let username: String
}

struct Trip {
    let tripId: Int
    let activityId: Int
    let categoryId: Int
}

class ModelController {
    var user = User(
        userId: 0,
        username: ""
    )
    var trip = Trip(
        tripId: 0,
        activityId: 0,
        categoryId: 0
    )
}
