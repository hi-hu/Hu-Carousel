//
//  FullScreenPhotoViewController.swift
//  Hu-Carousel
//
//  Created by Hi_Hu on 2/15/15.
//  Copyright (c) 2015 hi_hu. All rights reserved.
//

import UIKit

class FullScreenPhotoViewController: UIViewController {

    var defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var shareMenuContainer: UIView!
    
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

    @IBAction func shareDidPress(sender: AnyObject) {
        defaults.setBool(true, forKey: "photo_share")
        UIView.animateWithDuration(0.3, animations: {
            self.shareMenuContainer.transform = CGAffineTransformMakeTranslation(0, -350)
        })
    }

    @IBAction func cancelShareDidPress(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: {
            self.shareMenuContainer.transform = CGAffineTransformMakeTranslation(0, 350)
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
