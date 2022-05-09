//
//  ModelController.swift
//  VacayToday
//
//  Created by Maddie Tong on 5/4/22.
//

import Foundation

struct User: Codable {
    var userId: Int
    var username: String
}

struct Trip {
    var tripId: Int
    var activityId: Int
    var categoryId: Int
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
