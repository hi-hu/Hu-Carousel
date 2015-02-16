//
//  IntroViewController.swift
//  Hu-Carousel
//
//  Created by Hi_Hu on 2/10/15.
//  Copyright (c) 2015 hi_hu. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var introImage: UIImageView!
    @IBOutlet weak var tile1: UIImageView!
    @IBOutlet weak var tile2: UIImageView!
    @IBOutlet weak var tile3: UIImageView!
    @IBOutlet weak var tile4: UIImageView!
    @IBOutlet weak var tile5: UIImageView!
    @IBOutlet weak var tile6: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        introScrollView.delegate = self
        introScrollView.contentSize = introImage.frame.size
        
        tile1.center.x = 20
        tile1.center.y = 536
        tile1.transform = CGAffineTransformRotate(tile1.transform, -0.15)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {

        UIView.animateWithDuration(0.4, animations: {
            
             self.tile1.transform = CGAffineTransformMakeScale(2, 2)
            
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
