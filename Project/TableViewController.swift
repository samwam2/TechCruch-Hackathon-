////
////  TableViewController.swift
////  Project
////
////  Created by Catherine on 9/20/15.
////  Copyright © 2015 Catherine McMahon. All rights reserved.
////
//
//import Foundation
//import UIKit
//import Parse
//import ParseUI
//
//class TableViewController: PFQueryTableViewController {
//    
//    // Initialise the PFQueryTable tableview
//    override init(style: UITableViewStyle, className: String!) {
//        super.init(style: style, className: className)
//    }
//    
//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)!
//        
//        // Configure the PFQueryTableView
//        self.parseClassName = "User"
//        self.textKey = "FirstName"
//        self.textKey = "LastName"
//        self.pullToRefreshEnabled = true
//        self.paginationEnabled = false
//    }
//    
//    // Define the query that will provide the data for the table view
//    var userLocation = PFGeoPoint()
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
//    //override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell {
//        
//        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! PFTableViewCell!
//        if cell == nil {
//            cell = PFTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
//        }
//        
//        // Extract values from the PFObject to display in the table cell
//        if let nameEnglish = object?["nameEnglish"] as? String {
//            cell?.textLabel?.text = nameEnglish
//        }
//        if let capital = object?["capital"] as? String {
//            cell?.detailTextLabel?.text = capital
//        }
//        
//        return cell
//    }
//    
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        // Get the new view controller using [segue destinationViewController].
//        var detailScene = segue.destinationViewController as! DetailViewController
//        
//        // Pass the selected object to the destination view controller.
//        if let indexPath = self.tableView.indexPathForSelectedRow() {
//            let row = Int(indexPath.row)
//            detailScene.currentObject = (objects?[row] as! PFObject)
//        }
//    }
//}