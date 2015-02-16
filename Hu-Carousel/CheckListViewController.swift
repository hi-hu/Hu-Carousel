//
//  CheckListViewController.swift
//  Hu-Carousel
//
//  Created by Hi_Hu on 2/15/15.
//  Copyright (c) 2015 hi_hu. All rights reserved.
//

import UIKit

class CheckListViewController: UIViewController {
    
    var defaults = NSUserDefaults.standardUserDefaults()

    @IBOutlet weak var check1: UIImageView! // full screen
    @IBOutlet weak var check2: UIImageView! // swipe
    @IBOutlet weak var check3: UIImageView! // share

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var didSwipeLeft = defaults.boolForKey("swipe_left")
        var didSwipeRight = defaults.boolForKey("swipe_right")
        var viewedFullScreen = defaults.boolForKey("photo_full_screen")
        var sharedPhoto = defaults.boolForKey("photo_share")
        
        if(didSwipeLeft == true && didSwipeRight == true) {
            UIView.animateWithDuration(1, animations: {
                self.check2.alpha = 1
            })
        }
        if(viewedFullScreen == true) {
            UIView.animateWithDuration(1, animations: {
                self.check1.alpha = 1
            })
        }
        if(sharedPhoto == true) {
            UIView.animateWithDuration(1, animations: {
                self.check3.alpha = 1
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeDidPress(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
