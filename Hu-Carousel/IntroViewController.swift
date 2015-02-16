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
    
    var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
    var yOffsets : [Float] = [-288, -240, -415, -408, -480, -500]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        introScrollView.delegate = self
        introScrollView.contentSize = introImage.frame.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        var offset  = Float(scrollView.contentOffset.y)
        
        makeTransform(tile1, offset: offset, arrayIndex: 0)
        makeTransform(tile2, offset: offset, arrayIndex: 1)
        makeTransform(tile3, offset: offset, arrayIndex: 2)
        makeTransform(tile4, offset: offset, arrayIndex: 3)
        makeTransform(tile5, offset: offset, arrayIndex: 4)
        makeTransform(tile6, offset: offset, arrayIndex: 5)
    }

    func makeTransform(imageTile: UIImageView, offset: Float, arrayIndex: Int) {
        // content offset: 0->568
        // x offset: -30->0
        // y offset: -285->0
        
        var tX = convertValue(offset, 0, 568, xOffsets[arrayIndex], 0)
        var tY = convertValue(offset, 0, 568, yOffsets[arrayIndex], 0)
        var tScale = convertValue(offset, 0, 568, scales[arrayIndex], 1)
        var tRotation = convertValue(offset, 0, 568, rotations[arrayIndex], 0)
        
        imageTile.transform = CGAffineTransformMakeTranslation(CGFloat(tX), CGFloat(tY))
        imageTile.transform = CGAffineTransformScale(imageTile.transform, CGFloat(tScale), CGFloat(tScale))
        imageTile.transform = CGAffineTransformRotate(imageTile.transform, CGFloat(Double(tRotation) * M_PI / 180))
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
