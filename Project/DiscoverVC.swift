////
////  Discover.swift
////  Project
////
////  Created by Catherine on 9/19/15.
////  Copyright © 2015 Catherine McMahon. All rights reserved.
////
//
//import UIKit
//import Parse
//import ConvenienceKit
//
//class DiscoverVC: UIViewController {
//
//    // Initialise the PFQueryTable tableview
//    override init(style: UITableViewStyle, className: String!) {
//        super.init(style: style, className: className)
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Unwrap the current object object
//        if let object = currentObject {
//            nameEnglish.text = object["nameEnglish"] as! String
//            nameLocal.text = object["nameLocal"] as! String
//            capital.text = object["capital"] as! String
//            currencyCode.text = object["currencyCode"] as! String
//        }
//    }
//    
//    func queryUser() {
//    let query = PFQuery(className:"User")
//        query.getObjectInBackgroundWithId("xWMyZEGZ") {
//            (gameScore: PFObject?, error: NSError?) -> Void in
//            if error == nil && gameScore != nil {
//                print(gameScore)
//            } else {
//                print(error)
//            }
//        }
//    }
//    
//    var userLocation = PFGeoPoint()
//    
//    override func viewDidLoad() {
//        queryForTable()
//    }
//    
//    override func viewDidAppear(animated: Bool) {
//        queryForTable()
//    }
//    
//    func queryForTable() -> PFQuery {
//        let userGeoPoint: PFGeoPoint = self.userLocation
//        let query: PFQuery = PFQuery(className: "User")
//        query.whereKey("Location", nearGeoPoint: self.userLocation, withinKilometers: 5)
//        query.limit = 10
//        query.includeKey("FirstName")
//        query.includeKey("LastName")
//        return query
//    }
//    
////    func queryForNearbyUsers(currentLocation: CLLocation, withNearbyDistance nearbyDistance: CLLocationAccuracy) {
////        let query: PFQuery = PFQuery(className: "User")
////        query.findObjectsInBackgroundWithBlock({(objects: user, error: NSErrorPointer) in
////            
////        })
////    }
//}
//
