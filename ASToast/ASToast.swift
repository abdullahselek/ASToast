//
//  ASToast.swift
//  ASToast
//
//  Created by Abdullah Selek on 10/06/15.
//  Copyright (c) 2015 Abdullah Selek. All rights reserved.
//

import UIKit
import QuartzCore

// MARK: Constants

struct Constants {
    // duration of view on screen
    static let ASToastDuration = NSTimeInterval(3)
    
    // view appearance
    static let ASToastMaxWidth = CGFloat(0.8)
    static let ASToastMaxHeight = CGFloat(0.8)
    static let ASToastHorizontalPadding = CGFloat(10)
    static let ASToastVerticalPadding = CGFloat(10)
    static let ASToastCornerRadius = CGFloat(10)
    static let ASToastOpacity = CGFloat(0.8)
    static let ASToastFontSize = CGFloat(16)
    static let ASToastFadeDuration = NSTimeInterval(0.3)
    static let ASToastMaxTitleLines = 0
    static let ASToastMaxMessageLines = 0
    
    // value between 0.0 and 1.0
    static let ASToastViewAlpha = CGFloat(0.0)
    
    // shadow appearance
    static let ASToastDisplayShadow = true
    static let ASToastShadowOpacity = Float(0.8)
    static let ASToastShadowRadius = CGFloat(5.0)
    static var ASToastShadowOffset: CGSize = CGSize(width: 3.0, height: 3.0)

    // change visibility of view
    static let ASToastHidesOnTap = true
    
    // image view size
    static let ASToastImageViewWidth = CGFloat(80.0)
    static let ASToastImageViewHeight = CGFloat(80.0)
    
    // activity
    static let ASToastActivityWidth = CGFloat(100.0)
    static let ASToastActivityHeight = CGFloat(100.0)
    static let ASToastActivityDefaultPosition = ASToastPosition.ASToastPositionCenter
}

enum ASToastPosition: String {
    case ASToastPositionTop = "ASToastPositionTop",
    ASToastPositionCenter = "ASToastPositionCenter",
    ASToastPositionBotom = "ASToastPositionBotom"
}

private var timer: NSTimer!
private var activityView: UIView!

extension UIView {
    
    // MARK: Make toast methods
    
    func makeToast(message: String) {
        makeToast(message, duration: Constants.ASToastDuration, position: nil)
    }
    
    func makeToast(message: String, duration: NSTimeInterval, position: AnyObject?) {
        let toastView = self.toastView(message, title: "",  image: nil)
        self.showToast(toastView, duration: duration, position: position)
    }
    
    func makeToast(message: String, duration: NSTimeInterval, position: AnyObject?, title: String) {
        let toastView = self.toastView(message, title: title, image: nil)
        self.showToast(toastView, duration: duration, position: position)
    }
    
    func makeToast(message: String, duration: NSTimeInterval, position: AnyObject?, image: UIImage!) {
        let toastView = self.toastView(message, title: "", image: image)
        self.showToast(toastView, duration: duration, position: position)
    }
    
    func makeToast(message: String, duration: NSTimeInterval, position: AnyObject?, title: String, image: UIImage!) {
        let toastView = self.toastView(message, title: title, image: image)
        self.showToast(toastView, duration: duration, position: position)
    }
    
    // MARK: Toast view main methods
    
    func showToast(toastView: UIView!) {
        showToast(toastView, duration: Constants.ASToastDuration, position: nil)
    }
    
    func showToast(toastView: UIView!, duration: NSTimeInterval!, position: AnyObject?) {
        createAndShowToast(toastView, duration: duration, position: position)
    }
    
    private func createAndShowToast(toastView: UIView!, duration: NSTimeInterval!, position: AnyObject?) {
        toastView.center = centerPointForPosition(position, toastView: toastView)
        toastView.alpha = Constants.ASToastViewAlpha
        
        if Constants.ASToastHidesOnTap {
            let tapRecognizer: UITapGestureRecognizer! = UITapGestureRecognizer(target: toastView, action: "handleToastTapped:")
            toastView.addGestureRecognizer(tapRecognizer)
            toastView.userInteractionEnabled = true
            toastView.exclusiveTouch = true
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(duration, target: self, selector: "toastTimerDidFinish:", userInfo: toastView, repeats: false)
        
        self.addSubview(toastView)
        
        UIView.animateWithDuration(Constants.ASToastDuration, delay: 0.0, options: [UIViewAnimationOptions.CurveEaseInOut, UIViewAnimationOptions.AllowUserInteraction], animations: { () -> Void in
            toastView.alpha = 1.0
        }) { (Bool) -> Void in
            
        }
    }
    
    private func hideToast(toastView: UIView!) {
        UIView.animateWithDuration(Constants.ASToastFadeDuration, delay: 0.0, options: [UIViewAnimationOptions.CurveEaseIn, UIViewAnimationOptions.BeginFromCurrentState], animations: { () -> Void in
            toastView.alpha = 0.0
        }) { (Bool) -> Void in
            toastView.removeFromSuperview()
        }
    }

    private func toastView(message: String, title: String, image: UIImage?) -> UIView? {
        // check parameters
        if message.isEmpty && title.isEmpty && image == nil {
            return nil
        }
        
        // ui elements of toast
        var messageLabel: UILabel!
        var titleLabel: UILabel!
        var imageView: UIImageView!
        
        let toastView: UIView! = UIView()
        toastView.autoresizingMask = [UIViewAutoresizing.FlexibleLeftMargin, UIViewAutoresizing.FlexibleRightMargin, UIViewAutoresizing.FlexibleTopMargin, UIViewAutoresizing.FlexibleBottomMargin]
        toastView.layer.cornerRadius = Constants.ASToastCornerRadius
        
        // check if shadow needed
        if Constants.ASToastDisplayShadow == true {
            toastView.layer.shadowColor = UIColor.blackColor().CGColor
            toastView.layer.shadowOpacity = Constants.ASToastShadowOpacity
            toastView.layer.shadowRadius = Constants.ASToastShadowRadius
            toastView.layer.shadowOffset = Constants.ASToastShadowOffset
        }
        
        // set toastView background color
        toastView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(Constants.ASToastOpacity)
        
        // check image
        if(image != nil) {
            imageView = UIImageView(image: image)
            imageView.contentMode = UIViewContentMode.ScaleAspectFit
            imageView.frame = CGRectMake(Constants.ASToastHorizontalPadding, Constants.ASToastVerticalPadding, Constants.ASToastImageViewWidth, Constants.ASToastImageViewHeight)
        }
        
        var imageWidth, imageHeight, imageLeft: CGFloat!
        
        // the imageView frame values will be used to size & position the other views
        if(imageView != nil) {
            imageWidth = imageView.bounds.size.width;
            imageHeight = imageView.bounds.size.height;
            imageLeft = Constants.ASToastHorizontalPadding
        } else {
            imageWidth = 0.0
            imageHeight = 0.0
            imageLeft = 0.0
        }
        
        // check title if not empty create title label
        if !title.isEmpty {
            titleLabel = UILabel()
            titleLabel.numberOfLines = Constants.ASToastMaxTitleLines
            titleLabel.font = UIFont.boldSystemFontOfSize(Constants.ASToastFontSize)
            titleLabel.textAlignment = NSTextAlignment.Center
            titleLabel.textColor = UIColor.whiteColor()
            titleLabel.backgroundColor = UIColor.clearColor()
            titleLabel.alpha = 1.0
            titleLabel.text = title
            
            // set size the title label according to the lenth of title text
            let maxSizeTitle = CGSizeMake((self.bounds.size.width * Constants.ASToastMaxWidth) - imageWidth, self.bounds.size.height * Constants.ASToastMaxHeight)
            let expectedSizeTitle: CGSize! = sizeForString(title, font: titleLabel.font, constrainedSize: maxSizeTitle, lineBreakMode: titleLabel.lineBreakMode)
            titleLabel.frame = CGRectMake(0.0, 0.0, expectedSizeTitle.width, expectedSizeTitle.height)
        }
        
        // check message string if not empty create message label
        if !message.isEmpty {
            messageLabel = UILabel()
            messageLabel.numberOfLines = Constants.ASToastMaxMessageLines
            messageLabel.font = UIFont.systemFontOfSize(Constants.ASToastFontSize)
            messageLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
            messageLabel.textColor = UIColor.whiteColor()
            messageLabel.backgroundColor = UIColor.clearColor()
            messageLabel.alpha = 1.0
            messageLabel.text = message

            // set size the message label according to the lenth of message text
            let maxSizeMessage = CGSizeMake((self.bounds.size.width * Constants.ASToastMaxWidth) - imageWidth, self.bounds.size.height * Constants.ASToastMaxHeight)
            let expectedSizeMessage: CGSize! = sizeForString(message, font: messageLabel.font, constrainedSize: maxSizeMessage, lineBreakMode: messageLabel.lineBreakMode)
            messageLabel.frame = CGRectMake(0.0, 0.0, expectedSizeMessage.width, expectedSizeMessage.height)
        }
        
        // title label frame values
        var titleWidth, titleHeight, titleTop, titleLeft: CGFloat!
        
        if titleLabel != nil {
            titleWidth = titleLabel.bounds.size.width
            titleHeight = titleLabel.bounds.size.height
            titleTop = Constants.ASToastVerticalPadding
            titleLeft = imageLeft + imageWidth + Constants.ASToastHorizontalPadding
        } else {
            titleWidth = 0.0
            titleHeight = 0.0
            titleTop = 0.0
            titleLeft = 0.0
        }
        
        // message label frame values
        var messageWidth, messageHeight, messageLeft, messageTop: CGFloat!
        
        if messageLabel != nil {
            messageWidth = messageLabel.bounds.size.width
            messageHeight = messageLabel.bounds.size.height
            messageLeft = imageLeft + imageWidth + Constants.ASToastHorizontalPadding
            messageTop = titleTop + titleHeight + Constants.ASToastVerticalPadding
        } else {
            messageWidth = 0.0
            messageHeight = 0.0
            messageLeft = 0.0
            messageTop = 0.0
        }
        
        let longerWidth = max(titleWidth, messageWidth)
        let longerLeft = max(titleLeft, messageLeft)
        
        // toastView frames
        let toastViewWidth = max(imageWidth + (Constants.ASToastHorizontalPadding * 2), (longerLeft + longerWidth + Constants.ASToastHorizontalPadding))
        let toastViewHeight = max(messageTop + messageHeight + Constants.ASToastVerticalPadding, (imageHeight + (Constants.ASToastVerticalPadding * 2)))
        
        toastView.frame = CGRectMake(0.0, 0.0, toastViewWidth, toastViewHeight)
        
        if titleLabel != nil {
            titleLabel.frame = CGRectMake(titleLeft, titleTop, titleWidth, titleHeight)
            toastView.addSubview(titleLabel)
        }
        
        if messageLabel != nil {
            messageLabel.frame = CGRectMake(messageLeft, messageTop, messageWidth, messageHeight)
            toastView.addSubview(messageLabel)
        }
        
        if imageView != nil {
            toastView.addSubview(imageView)
        }
        
        return toastView
    }

    // MARK: Toast view events
    
    func toastTimerDidFinish(timer: NSTimer) {
        self.hideToast(timer.userInfo as? UIView!)
    }
    
    func handleToastTapped(recognizer: UITapGestureRecognizer) {
        timer.invalidate()
        hideToast(recognizer.view)
    }
    
    // MARK: Toast activity methods
    
    func makeToastActivity() {
        makeToastActivity(Constants.ASToastActivityDefaultPosition.rawValue)
    }
    
    private func makeToastActivity(position: AnyObject) {
        activityView = UIView(frame: CGRectMake(0.0, 0.0, Constants.ASToastActivityWidth, Constants.ASToastActivityHeight))
        activityView.center = centerPointForPosition(position, toastView: activityView)
        activityView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(Constants.ASToastOpacity)
        activityView.alpha = Constants.ASToastViewAlpha
        activityView.autoresizingMask = [UIViewAutoresizing.FlexibleLeftMargin, UIViewAutoresizing.FlexibleRightMargin, UIViewAutoresizing.FlexibleTopMargin, UIViewAutoresizing.FlexibleBottomMargin]
        activityView.layer.cornerRadius = Constants.ASToastCornerRadius
        
        if Constants.ASToastDisplayShadow {
            activityView.layer.shadowColor = UIColor.blackColor().CGColor
            activityView.layer.shadowOpacity = Constants.ASToastShadowOpacity
            activityView.layer.shadowRadius = Constants.ASToastShadowRadius
            activityView.layer.shadowOffset = Constants.ASToastShadowOffset
        }
        
        let activityIndicatorView: UIActivityIndicatorView! = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
        activityIndicatorView.center = CGPointMake(activityView.bounds.size.width / 2, activityView.bounds.size.height / 2)
        activityView.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
        
        self.addSubview(activityView)
        
        UIView.animateWithDuration(Constants.ASToastDuration, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            activityView.alpha = 1.0
        }, completion: nil)
    }
    
    func hideToastActivity() {
        if activityView != nil {
            UIView.animateWithDuration(Constants.ASToastFadeDuration, delay: 0.0, options: [UIViewAnimationOptions.CurveEaseIn, UIViewAnimationOptions.BeginFromCurrentState], animations: { () -> Void in
                activityView.alpha = 0.0
            }, completion: { (Bool) -> Void in
                activityView.removeFromSuperview()
            })
        }
    }
    
    // MARK: Helpers
    
    private func centerPointForPosition(point: AnyObject?, toastView: UIView!) -> CGPoint {
        if point != nil {
            if point!.isKindOfClass(NSString) {
                if point!.caseInsensitiveCompare(ASToastPosition.ASToastPositionTop.rawValue) == NSComparisonResult.OrderedSame {
                    return CGPointMake(self.bounds.size.width / 2, (toastView.frame.size.height / 2) + Constants.ASToastVerticalPadding)
                } else if point!.caseInsensitiveCompare(ASToastPosition.ASToastPositionCenter.rawValue) == NSComparisonResult.OrderedSame {
                    return CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2)
                }
            } else if point!.isKindOfClass(NSValue) {
                return point!.CGPointValue
            }
        }
        
        // default bottom option
        return CGPointMake(self.bounds.size.width / 2, (self.bounds.size.height - (toastView.frame.size.height / 2)) - Constants.ASToastVerticalPadding)
    }
    
    private func sizeForString(text: NSString, font: UIFont, constrainedSize: CGSize, lineBreakMode: NSLineBreakMode) -> CGSize {
        if text.respondsToSelector("boundingRectWithSize:options:attributes:context:") {
            let paragraphStyle: NSMutableParagraphStyle! = NSMutableParagraphStyle()
            paragraphStyle.lineBreakMode = lineBreakMode
            let attributes: Dictionary = [NSFontAttributeName: font, NSParagraphStyleAttributeName: paragraphStyle]
            let boundingRect: CGRect! = text.boundingRectWithSize(constrainedSize, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: attributes, context: nil)
            return CGSizeMake(boundingRect.size.width, boundingRect.size.height)
        }
        
        return CGSizeMake(0.0, 0.0)
    }
    
}