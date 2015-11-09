//
//  RestaurantListViewController.swift
//  FirebaseRestaurantMiniLesson
//
//  Created by Jordan Nelson on 11/9/15.
//  Copyright © 2015 Jordan Nelson. All rights reserved.
//

import UIKit

class RestaurantListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nc = NSNotificationCenter.defaultCenter()
        nc.addObserver(self, selector: "restaurantsUpdated:", name: RestaurantsUpdatedNotification, object: nil)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }

    @IBAction func addButtonPressed(sender: UIBarButtonItem) {
        presentAlertController()
    }
   
    func presentAlertController() {
        let alert = UIAlertController(title: "Add Restaurant", message: "Enter restaurant details below.", preferredStyle: UIAlertControllerStyle.Alert)
        
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(cancel)
        
        let save = UIAlertAction(title: "Save", style: UIAlertActionStyle.Default) { (action) -> Void in
            if let textfields = alert.textFields,
                let name = textfields[0].text,
                let address = textfields[1].text,
                let category = textfields[2].text {
                    
                    let restaurantDictionary = ["name":name, "address":address, "category":category]
                    RestaurantController.sharedController.addRestaurant(Restaurant(dictionary: restaurantDictionary))
            }
            
        }
        alert.addAction(save)
        
        alert.addTextFieldWithConfigurationHandler { (nameField) -> Void in
            nameField.placeholder = "Name"
        }
        alert.addTextFieldWithConfigurationHandler { (addressField) -> Void in
            addressField.placeholder = "Address"
        }
        alert.addTextFieldWithConfigurationHandler { (categoryField) -> Void in
            categoryField.placeholder = "Category"
        }
        
        presentViewController(alert, animated: true, completion: nil)
    }

    
    func restaurantsUpdated(notification: NSNotification) {
        tableView.reloadData()
    }
}

extension RestaurantListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("restaurantCell", forIndexPath: indexPath)
        
        let restaurant =  RestaurantController.sharedController.restaurants[indexPath.row]
        
        cell.textLabel?.text = restaurant.name
        cell.detailTextLabel?.text = restaurant.address
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RestaurantController.sharedController.restaurants.count
    }
}
