//
//  FirebaseController.swift
//  FirebaseRestaurantMiniLesson
//
//  Created by Jordan Nelson on 11/9/15.
//  Copyright © 2015 Jordan Nelson. All rights reserved.
//

import Foundation
import Firebase

class FirebaseController {
    
    static let base = Firebase(url: "https://local-restaurant.firebaseio.com")
    static let restaurantBase = base.childByAppendingPath("Restaurants")
    
}




