//
//  ViewController.swift
//  Project
//
//  Created by Catherine on 9/19/15.
//  Copyright © 2015 Catherine McMahon. All rights reserved.
//

import Foundation
import UIKit
import Parse
import ParseUI

class SignUpVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var organization: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var url: UITextField!
    @IBOutlet weak var desc: UITextField!
    
    var user = PFObject(className: "User")

    //sam code
//    var ImageNew = UIImage()
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var setPictureButton: UIButton!
    
    @IBAction func loadImageButtonTapped(sender: AnyObject) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
        setPictureButton.hidden = true
        
        
    }
    
    let imagePicker = UIImagePickerController()
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = pickedImage

            let imageData = UIImagePNGRepresentation(pickedImage)
            let imageFile = PFFile(name: "pickedImage.png", data: imageData!)
//            var userPhoto = PFObject(className: "User")
            user["Image"] = imageFile
            user.saveInBackground()
            

            
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    //End sam code
    
    var objectId: String?
    
    override func viewDidAppear(animated: Bool) {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: "handleSingleTap:")
        tapRecognizer.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapRecognizer)
        
        var nav = self.navigationController?.navigationBar
        nav?.tintColor = UIColor.whiteColor()
        
        let customFont = UIFont(name: "Avenir", size: 18.0)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSFontAttributeName: customFont!], forState: UIControlState.Normal)
        
        UINavigationBar.appearance().titleTextAttributes = [ NSFontAttributeName: customFont!]
        UIBarButtonItem.appearance().setTitleTextAttributes([NSFontAttributeName: customFont!], forState: UIControlState.Normal)
    }
    
    private func setupBarStyle() {
        if let font = UIFont(name: "Avenir", size: 18) {
            UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: font]
        }
        
        navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        var attributes = [
            NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSFontAttributeName: UIFont(name: "Avenir", size: 20)!
        ]
        self.navigationController?.navigationBar.titleTextAttributes = attributes
        
        navigationItem.leftBarButtonItem?.tintColor = UIColor.whiteColor()
        self.navigationItem
    }
    
    
    func handleSingleTap(recognizer: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.hidden = false
    }
    
    @IBAction func enter(sender: AnyObject) {
        if(firstName.text != nil && lastName.text != nil){
            signUp()
        } else {
            let alert = UIAlertController(title: "Error", message: "Please fill in your full name.", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: Sign Up
    func signUp() {
        
        if firstName.hasText() && lastName.hasText() {
            
//            let user = PFObject(className:"User")

            PFGeoPoint.geoPointForCurrentLocationInBackground {
                (geoPoint: PFGeoPoint?, error: NSError?) -> Void in
                    self.user.setObject(geoPoint!, forKey: "Location")
            }
            
            let manager = CLLocationManager()
            //let loc =  manager.location!.coordinate
            //let actualLocation = PFGeoPoint(latitude:loc.latitude,longitude:loc.longitude)
            //user["Location"] = actualLocation
            
            user.setValue(firstName.text, forKey:"FirstName")
            user.setValue(lastName.text, forKey:"LastName")
            user.setValue(organization.text, forKey:"Organization")
            user.setValue(email.text, forKey:"Email")
            user.setValue(url.text, forKey:"Url")
            user.setValue(desc.text, forKey:"Description")

            user.saveInBackgroundWithBlock {
                (success: Bool, error: NSError?) -> Void in
                if (success) {
                    dispatch_async(dispatch_get_main_queue()) {
                        self.performSegueWithIdentifier("signUpToMainVC", sender: self)
                    }
                }
            }
        } else {
            let alert = UIAlertController(title: "Error", message: "Please fill in your full name.", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
