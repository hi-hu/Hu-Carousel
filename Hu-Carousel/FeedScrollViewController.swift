//
//  FeedScrollViewController.swift
//  Hu-Carousel
//
//  Created by Hi_Hu on 2/13/15.
//  Copyright (c) 2015 hi_hu. All rights reserved.
//

import UIKit

class FeedScrollViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var learnMoreImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImage: UIImageView!

    var defaults = NSUserDefaults.standardUserDefaults()
    
    // NSUserDefaults for saving states    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        scrollView.delegate = self
        scrollView.contentSize = feedImage.frame.size
        
        // setting NSUserDefaults to all false
        defaults.setBool(false, forKey: "photo_full_screen")
        defaults.setBool(false, forKey: "swipe_right")
        defaults.setBool(false, forKey: "swipe_left")
        defaults.setBool(false, forKey: "photo_share")
        defaults.synchronize()
        
        // setting the variables for swipe recognition
        var swipeLeft: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "swipeLeft")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        var swipeRight: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "swipeRight")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func viewPhotoDidPress(sender: AnyObject) {
        defaults.setBool(true, forKey: "photo_full_screen")
    }

    @IBAction func bannerDidDismiss(sender: AnyObject) {
        dismissBanner()
    }

    func swipeLeft() {
        defaults.setBool(true, forKey: "swipe_left")
        defaults.synchronize()
        viewDidAppear(true)
    }

    func swipeRight() {
        defaults.setBool(true, forKey: "swipe_right")
        defaults.synchronize()
        viewDidAppear(true)
    }
    
    func dismissBanner() {
        UIView.animateWithDuration(0.4, animations: {
            self.learnMoreImage.transform = CGAffineTransformMakeTranslation(-321, 0)
            self.scrollView.transform = CGAffineTransformMakeTranslation(0, -44)
            self.scrollView.contentSize.height = self.scrollView.contentSize.height - 44
        })
        self.learnMoreImage.hidden = true
    }
    
    func checkTasks() -> Bool {
        var didSwipeLeft = defaults.boolForKey("swipe_left")
        var didSwipeRight = defaults.boolForKey("swipe_right")
        var viewedFullScreen = defaults.boolForKey("photo_full_screen")
        var sharedPhoto = defaults.boolForKey("photo_share")
        
        if( didSwipeLeft == true && didSwipeRight == true && viewedFullScreen == true && sharedPhoto == true) {
            return true
        }
        return false
    }
    
    override func viewDidAppear(animated: Bool) {
        if(checkTasks()) {
            dismissBanner()
        }
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
