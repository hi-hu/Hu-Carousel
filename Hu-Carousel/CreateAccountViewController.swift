//
//  CreateAccountViewController.swift
//  Hu-Carousel
//
//  Created by Hi_Hu on 2/15/15.
//  Copyright (c) 2015 hi_hu. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var checkedBox: UIImageView!
    @IBOutlet weak var fieldsContainer: UIView!
    @IBOutlet weak var createButtonImage: UIImageView!
    @IBOutlet weak var createButton: UIButton!
    
    var isKeyboardUp = false
    var fieldsContainerOriginY: CGFloat!
    var createButtonImageOriginY: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        fieldsContainerOriginY = fieldsContainer.center.y
        createButtonImageOriginY = createButtonImage.center.y
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
                
                self.fieldsContainer.center.y = self.fieldsContainer.center.y - kbSize.height/2
                self.createButtonImage.center.y = self.createButtonImage.center.y - kbSize.height + 50
                self.createButton.center.y = self.createButton.center.y - kbSize.height + 50
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
            
            self.fieldsContainer.center.y = self.fieldsContainerOriginY
            self.createButtonImage.center.y = self.createButtonImageOriginY
            self.createButton.center.y = self.createButtonImageOriginY
            
            }, completion: nil)
        isKeyboardUp = false
    }

    @IBAction func tapGesture(sender: AnyObject) {
            view.endEditing(true)
    }
    
    @IBAction func backDidPress(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }

    @IBAction func checkboxDidCheck(sender: AnyObject) {
        UIView.animateWithDuration(0.1, animations: {
            self.checkedBox.alpha = 1
        })
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
