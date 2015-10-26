////
////  DetailViewController.swift
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
//class DetailViewController: UIViewController {
//    
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
//    // Some text fields
//    @IBOutlet weak var firstName: UITextField!
//    @IBOutlet weak var lastName: UITextField!
//    @IBOutlet weak var capital: UITextField!
//    @IBOutlet weak var currencyCode: UITextField!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//}
