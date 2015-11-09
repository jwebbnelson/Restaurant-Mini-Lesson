//
//  Restaurant.swift
//  FirebaseRestaurantMiniLesson
//
//  Created by Jordan Nelson on 11/9/15.
//  Copyright © 2015 Jordan Nelson. All rights reserved.
//

import Foundation
import Firebase


class Restaurant {
    
    var name: String
    var category: String
    var address: String

    init(dictionary:[String:AnyObject]) {
        
        guard let name = dictionary["name"] as? String,
            let category = dictionary["category"] as? String,
            let address = dictionary["address"] as? String else {
                self.name = ""
                self.category = ""
                self.address = ""
                return
        }
        self.name = name
        self.address = address
        self.category = category
    }
    
    func dictionaryCopy() -> [String:AnyObject] {
        return ["name":name,
            "address": address,
            "category": category]
    }
    
}










