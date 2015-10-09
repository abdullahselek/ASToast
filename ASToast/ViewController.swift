//
//  ViewController.swift
//  ASToast
//
//  Created by Abdullah Selek on 10/06/15.
//  Copyright (c) 2015 Abdullah Selek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isShowingActivity: Bool! = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Button action
    
    @IBAction func buttonTapped(sender: AnyObject) {
        switch(sender.tag) {
        case 0:
            // make a toast with single text
            self.view.makeToast("Single text toast")
            break
        case 1:
            // make a toast with text, title, position and duration
            self.view.makeToast("Toast with custom text, title and duration", duration: NSTimeInterval(3.0), position: ASToastPosition.ASToastPositionCenter.rawValue, title: "Title")
            break
        case 2:
            // Make toast with an image
            self.view.makeToast("Toast with an image", duration: NSTimeInterval(3.0), position: ASToastPosition.ASToastPositionTop.rawValue, image: UIImage(named: "apple_logo"))
            break
        case 3:
            // Make toast with an title & image
            self.view.makeToast("Toast with an title & image", duration: NSTimeInterval(3.0), position: ASToastPosition.ASToastPositionCenter.rawValue, title: "Title", image: UIImage(named: "apple_logo"))
            break
        case 4:
            // Show a custom view as toast
            let customView: UIView! = UIView(frame: CGRectMake(0.0, 0.0, 200.0, 300.0))
            customView.autoresizingMask = [UIViewAutoresizing.FlexibleLeftMargin, UIViewAutoresizing.FlexibleRightMargin, UIViewAutoresizing.FlexibleTopMargin, UIViewAutoresizing.FlexibleBottomMargin]
            customView.backgroundColor = UIColor.greenColor()

            self.view.showToast(customView, duration: NSTimeInterval(3.0), position: ASToastPosition.ASToastPositionCenter.rawValue)
            break
        case 5:
            // Show an imageView as toast, on center at point (110,110)
            let toastImageView: UIImageView! = UIImageView(image: UIImage(named: "apple_logo"))
            self.view.showToast(toastImageView, duration: NSTimeInterval(3.0), position: NSValue(CGPoint: CGPointMake(110, 110)))
            break;
        case 6:
            let button: UIButton! = sender as! UIButton
            if !isShowingActivity {
                self.view.makeToastActivity()
                button.setTitle("Hide Activity", forState: UIControlState.Normal)
            } else {
                self.view.hideToastActivity()
                button.setTitle("Show Activity", forState: UIControlState.Normal)
            }
            
            isShowingActivity = !isShowingActivity
            break
        default:
            break
        }
    }

}

