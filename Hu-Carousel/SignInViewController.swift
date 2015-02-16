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
        
        UIView.animateWithDuration(0.6, animations: {
            self.loginContainer.transform = CGAffineTransformMakeScale(0.4, 0.4)
            self.loginContainer.alpha = 1
            self.loginContainer.transform = CGAffineTransformMakeScale(1, 1)
        })
        
        var swipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "dismissKeyboard")
        swipe.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipe)
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

        if(emailField.text == "") {

            var alertView = UIAlertView(
                title: "Email Required",
                message: "Please enter your email",
                delegate: self,
                cancelButtonTitle: "OK"
            )
            alertView.show()
            
        } else if(passwordField.text == "") {
            
            var alertView = UIAlertView(
                title: "Password Required",
                message: "Please enter your password",
                delegate: self,
                cancelButtonTitle: "OK"
            )
            alertView.show()

        } else {
            var alertView = UIAlertView(
                title: "Signing in…",
                message: nil,
                delegate: self,
                cancelButtonTitle: nil
            )
            alertView.show()

            delay(2) {
                alertView.dismissWithClickedButtonIndex(0, animated: true)
                self.checkPassword()
            }
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
    
    // delay method
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    func checkPassword() {
        if(emailField.text == "mike@test.com" && passwordField.text == "123456") {
            
            // successful signin
            self.performSegueWithIdentifier("loginSegue", sender: self)
            
        } else {
            var alertView = UIAlertView(
                title: "Sign In Failed",
                message: "Invalid email or password",
                delegate: self,
                cancelButtonTitle: "OK"
            )
            alertView.show()
        }
    }
    
    func dismissKeyboard() {
        self.emailField.resignFirstResponder()
        self.passwordField.resignFirstResponder()
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
