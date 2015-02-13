//
//  TourScrollViewController.swift
//  Hu-Carousel
//
//  Created by Hi_Hu on 2/12/15.
//  Copyright (c) 2015 hi_hu. All rights reserved.
//

import UIKit

class TourScrollViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var buttonContainer: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 1280, height: 568)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var page = Int(scrollView.contentOffset.x / (scrollView.contentSize.width/4))
        pageControl.currentPage = page
        
        if(page == 3) {
            UIView.animateWithDuration(0.4, animations: {
                self.buttonContainer.alpha = 1
                self.buttonContainer.transform = CGAffineTransformMakeTranslation(0, -2)
            })
        } else {
            UIView.animateWithDuration(0.4, animations: {
                self.buttonContainer.alpha = 0
                self.buttonContainer.transform = CGAffineTransformMakeTranslation(0, 2)
            })
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
