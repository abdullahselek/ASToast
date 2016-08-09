//
//  ASToast.swift
//  ASToast
//
//  Created by Abdullah Selek on 10/06/15.
//  Copyright (c) 2015 Abdullah Selek. All rights reserved.
//

// The MIT License (MIT)

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit
import QuartzCore

// MARK: Constants

/**
  * Default toast constants
 */
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

/**
  * Toast positions
 */
public enum ASToastPosition: String {
    case ASToastPositionTop = "ASToastPositionTop",
    ASToastPositionCenter = "ASToastPositionCenter",
    ASToastPositionBotom = "ASToastPositionBotom"
}

private var timer: NSTimer!
private var activityView: UIView!

public extension UIView {
    
    // MARK: Make toast methods
    
    /**
      * Show a toast with given string
      *
      * @param message Message Text
     */
    public func makeToast(message: String, backgroundColor: UIColor?) {
        makeToast(message, duration: Constants.ASToastDuration, position: nil,
                  backgroundColor: backgroundColor)
    }
    
    /**
      * Show a toast with given string, duration and position
      *
      * @param message Message Text
      * @param duration The time duration toast will displayed on the screen
      * @param position The position that toast will displayed
     */
    public func makeToast(message: String, duration: NSTimeInterval, position: AnyObject?,
                          backgroundColor: UIColor?) {
        let toastView = self.toastView(message, title: "",  image: nil, backgroundColor: backgroundColor)
        if toastView != nil {
            self.showToast(toastView, duration: duration, position: position)
        }
    }
    
    /**
      * Show a toast with given string, duration, position and title
      *
      * @param message Message Text
      * @param duration The time duration toast will displayed on the screen
      * @param position The position that toast will displayed
      * @param title Title for Toast
     */
    public func makeToast(message: String, duration: NSTimeInterval, position: AnyObject?,
                          title: String, backgroundColor: UIColor?) {
        let toastView = self.toastView(message, title: title, image: nil, backgroundColor: backgroundColor)
        self.showToast(toastView, duration: duration, position: position)
    }
    
    /**
      * Show a toast with given string, duration, position and image
      *
      * @param message Message Text
      * @param duration The time duration toast will displayed on the screen
      * @param position The position that toast will displayed
      * @param image Image for Toast
     */
    public func makeToast(message: String, duration: NSTimeInterval, position: AnyObject?,
                          image: UIImage!, backgroundColor: UIColor?) {
        let toastView = self.toastView(message, title: "", image: image, backgroundColor: backgroundColor)
        self.showToast(toastView, duration: duration, position: position)
    }
    
    /**
      * Show a toast with given string, duration, position, title and image
      *
      * @param message Message Text
      * @param duration The time duration toast will displayed on the screen
      * @param position The position that toast will displayed
      * @param title Title for Toast
      * @param image Image for Toast
     */
    public func makeToast(message: String, duration: NSTimeInterval, position: AnyObject?,
                          title: String, image: UIImage!, backgroundColor: UIColor?) {
        let toastView = self.toastView(message, title: title, image: image, backgroundColor: backgroundColor)
        self.showToast(toastView, duration: duration, position: position)
    }
    
    // MARK: Toast view main methods
    
    /**
      * Show toast view with constant duration (3 seconds)
      *
      * @param toastView Toast view
     */
    public func showToast(toastView: UIView!) {
        showToast(toastView, duration: Constants.ASToastDuration, position: nil)
    }
    
    /**
      * Show toast view with duration and position
      *
      * @param toastView Toast view
      * @param duration The time duration toast will displayed on the screen
      * @param position The position that toast will displayed
     */
    public func showToast(toastView: UIView!, duration: NSTimeInterval!, position: AnyObject?) {
        createAndShowToast(toastView, duration: duration, position: position)
    }
    
    /**
      * Create and show toast
      *
      * @param toastView Toast view
      * @param duration The time duration toast will displayed on the screen
      * @param position The position that toast will displayed
     */
    private func createAndShowToast(toastView: UIView!, duration: NSTimeInterval!, position: AnyObject?) {
        if toastView == nil {
            return
        }
        toastView.center = centerPointForPosition(position, toastView: toastView)
        toastView.alpha = Constants.ASToastViewAlpha
        
        if Constants.ASToastHidesOnTap {
            let tapRecognizer: UITapGestureRecognizer! = UITapGestureRecognizer(target: toastView, action: #selector(UIView.handleToastTapped(_:)))
            toastView.addGestureRecognizer(tapRecognizer)
            toastView.userInteractionEnabled = true
            toastView.exclusiveTouch = true
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(duration, target: self, selector: #selector(UIView.toastTimerDidFinish(_:)), userInfo: toastView, repeats: false)
        
        self.addSubview(toastView)
        
        UIView.animateWithDuration(Constants.ASToastDuration, delay: 0.0, options: [UIViewAnimationOptions.CurveEaseInOut, UIViewAnimationOptions.AllowUserInteraction], animations: { () -> Void in
            toastView.alpha = 1.0
        }) { (Bool) -> Void in
            
        }
    }
    
    /**
      * Hide toast view
      *
      * @param toastView Toast view
     */
    private func hideToast(toastView: UIView!) {
        UIView.animateWithDuration(Constants.ASToastFadeDuration, delay: 0.0, options: [UIViewAnimationOptions.CurveEaseIn, UIViewAnimationOptions.BeginFromCurrentState], animations: { () -> Void in
            toastView.alpha = 0.0
        }) { (Bool) -> Void in
            toastView.removeFromSuperview()
        }
    }

    /**
      * Creates toast view with given message, title and title
      *
      * @param message Message Text
      * @param title Title for Toast
      * @param image Image for Toast
     */
    private func toastView(message: String, title: String, image: UIImage?, backgroundColor: UIColor?) -> UIView? {
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
        if backgroundColor != nil {
            toastView.backgroundColor = backgroundColor!.colorWithAlphaComponent(Constants.ASToastOpacity)
        } else {
            toastView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(Constants.ASToastOpacity)
        }
        
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
    
    /**
      * Finish event handler for timer
      *
      * @param timer NSTimer
     */
    func toastTimerDidFinish(timer: NSTimer) {
        self.hideToast(timer.userInfo as? UIView!)
    }
    
    /**
      * Tap gesture handler
      *
      * @param recognizer UITapGestureRecognizer
     */
    func handleToastTapped(recognizer: UITapGestureRecognizer) {
        timer.invalidate()
        hideToast(recognizer.view)
    }
    
    // MARK: Toast activity methods
    
    /**
      * Show a toast with activity indicator
     */
    public func makeToastActivity() {
        makeToastActivity(Constants.ASToastActivityDefaultPosition.rawValue)
    }
    
    /**
      * Create toast with given position
      *
      * @param position The position that toast will displayed
     */
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
    
    /**
      * Hide activity indicator toast
     */
    public func hideToastActivity() {
        if activityView != nil {
            UIView.animateWithDuration(Constants.ASToastFadeDuration, delay: 0.0, options: [UIViewAnimationOptions.CurveEaseIn, UIViewAnimationOptions.BeginFromCurrentState], animations: { () -> Void in
                activityView.alpha = 0.0
            }, completion: { (Bool) -> Void in
                activityView.removeFromSuperview()
            })
        }
    }
    
    // MARK: Helpers
    
    /**
      * Center toast with given point and view
      *
      * @param point Position to centralize
      * @param toastView Toast view
     */
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
    
    /**
      * Calculates string size with given text, font, constrained and mode
      *
      * @param text Toast view message
      * @param font UIFont used for text
      * @param constrainedSize CGSize
      * @param lineBreakMode NSLineBreakMode
     */
    private func sizeForString(text: NSString, font: UIFont, constrainedSize: CGSize, lineBreakMode: NSLineBreakMode) -> CGSize {
        if text.respondsToSelector(#selector(NSString.boundingRectWithSize(_:options:attributes:context:))) {
            let paragraphStyle: NSMutableParagraphStyle! = NSMutableParagraphStyle()
            paragraphStyle.lineBreakMode = lineBreakMode
            let attributes: Dictionary = [NSFontAttributeName: font, NSParagraphStyleAttributeName: paragraphStyle]
            let boundingRect: CGRect! = text.boundingRectWithSize(constrainedSize, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: attributes, context: nil)
            return CGSizeMake(boundingRect.size.width, boundingRect.size.height)
        }
        
        return CGSizeMake(0.0, 0.0)
    }
    
}