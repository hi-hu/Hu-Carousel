//
//  SignInViewController.swift
//  Hu-Carousel
//
//  Created by Hi_Hu on 2/11/15.
//  Copyright (c) 2015 hi_hu. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backDidPress(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }

    @IBAction func signInDidPress(sender: AnyObject) {

        if (emailField.text == "") {
            var alertView = UIAlertView(
                title: "Email Required",
                message: "Please enter your email address",
                delegate: self,
                cancelButtonTitle: "OK"
            )
        alertView.show()
        }
    }

    @IBAction func tapGesture(sender: AnyObject) {
        view.endEditing(true)
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
