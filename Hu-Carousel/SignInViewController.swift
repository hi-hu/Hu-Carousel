//
//  SignInViewController.swift
//  Hu-Carousel
//
//  Created by Hi_Hu on 2/11/15.
//  Copyright (c) 2015 hi_hu. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet weak var loginContainer: UIView!
    @IBOutlet weak var signInContainer: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var loginContainerOriginY: CGFloat!
    var signInContainerOriginY: CGFloat!
    var isKeyboardUp = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginContainerOriginY = loginContainer.center.y
        signInContainerOriginY = signInContainer.center.y

        // registering keyboard events
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // back button event that pops the navigation view
    @IBAction func backDidPress(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }

    // show alert view
    @IBAction func signInDidPress(sender: AnyObject) {

        if(emailField.text == "" || passwordField.text == "") {
            var alertView = UIAlertView(
                title: "Email and Password Required",
                message: "Please enter your email or password",
                delegate: self,
                cancelButtonTitle: "OK"
            )
        alertView.show()
        } else if(emailField.text == "mike@test.com" && passwordField.text == "123456") {
            // successful signin
            // show load animation
        } else {
            // display incorrect login message
        }
    }

    // dismiss keyboard when tapping anywhere outside
    @IBAction func tapGesture(sender: AnyObject) {
        view.endEditing(true)
    }

    
    // keyboard show & hide functions
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue

        if(isKeyboardUp == false) {
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
    
            self.loginContainer.center.y = self.loginContainer.center.y - kbSize.height/2
            self.signInContainer.center.y = self.signInContainer.center.y - kbSize.height
            
            }, completion: nil)
            isKeyboardUp = true
        }
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            self.loginContainer.center.y = self.loginContainerOriginY
            self.signInContainer.center.y = self.signInContainerOriginY
            
            }, completion: nil)
        isKeyboardUp = false
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
