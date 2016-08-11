//
//  Models.swift
//  WhosCookin
//
//  Created by iwritecode on 8/11/16.
//  Copyright © 2016 ImagineME. All rights reserved.
//

import Foundation

struct FeedItem {
    let food: Food
    let distance: String
    let rating: String
    let price: String
}

struct User {
    let id: String
    let fullName: String
    let email: String
    let password: String
}

struct Food {
    let name: String
    let price: String
    let imageName: String?
}

struct Order {
    let food: Food
    let quantity: Int
}
