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

    @IBAction func buttonTapped(_ sender: AnyObject) {
        switch(sender.tag) {
        case 0:
            // make a toast with single text
            self.view.makeToast(message: "Single text toast",
                                backgroundColor: nil,
                                messageColor: UIColor.cyan)
            break
        case 1:
            // make a toast with text, title, position and duration
            self.view.makeToast(message: "Toast with custom text, title and duration",
                                duration: TimeInterval(1.0),
                                position: .center,
                                title: "Title",
                                backgroundColor: UIColor.blue,
                                titleColor: UIColor.yellow,
                                messageColor: UIColor.yellow,
                                font: nil)
            break
        case 2:
            // Make toast with an image
            self.view.makeToast(message: "Toast with an image",
                                duration: TimeInterval(3.0),
                                position: .top,
                                image: UIImage(named: "apple_logo"),
                                backgroundColor: UIColor.blue,
                                titleColor: UIColor.yellow,
                                messageColor: UIColor.yellow,
                                font: nil)
            break
        case 3:
            // Make toast with an title & image
            self.view.makeToast(message: "Toast with an title & image",
                                duration: TimeInterval(1.0),
                                position: .center,
                                title: "Title",
                                image: UIImage(named: "apple_logo"),
                                backgroundColor: UIColor.blue,
                                titleColor: UIColor.cyan,
                                messageColor: UIColor.yellow,
                                font: nil)
            break
        case 4:
            // Show a custom view as toast
            let customView: UIView! = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 300.0))
            customView.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin,
                                           UIView.AutoresizingMask.flexibleRightMargin,
                                           UIView.AutoresizingMask.flexibleTopMargin,
                                           UIView.AutoresizingMask.flexibleBottomMargin]
            customView.backgroundColor = UIColor.green

            self.view.showToast(toastView: customView, duration: TimeInterval(3.0), position: .center)
            break
        case 5:
            // Show an imageView as toast, on center at point (110,110)
            let toastImageView = UIImageView(image: UIImage(named: "apple_logo"))
            self.view.showToast(toastView: toastImageView, duration: TimeInterval(3.0), point: CGPoint(x: 110, y: 110))
            break
        case 6:
            guard let button = sender as? UIButton else {
                return
            }
            if !isShowingActivity {
                self.view.makeToastActivity()
                button.setTitle("Hide Activity", for: UIControl.State())
            } else {
                self.view.hideToastActivity()
                button.setTitle("Show Activity", for: UIControl.State())
            }

            isShowingActivity = !isShowingActivity
            break
        default:
            break
        }
    }

}

