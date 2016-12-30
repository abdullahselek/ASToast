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
  Default toast constants
 */
struct Constants {
    // duration of view on screen
    static let ASToastDuration = TimeInterval(3)
    
    // view appearance
    static let ASToastMaxWidth = CGFloat(0.8)
    static let ASToastMaxHeight = CGFloat(0.8)
    static let ASToastHorizontalPadding = CGFloat(10)
    static let ASToastVerticalPadding = CGFloat(10)
    static let ASToastCornerRadius = CGFloat(10)
    static let ASToastOpacity = CGFloat(0.8)
    static let ASToastFontSize = CGFloat(16)
    static let ASToastFadeDuration = TimeInterval(0.3)
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
  Toast positions
 */
public enum ASToastPosition: String {
    case ASToastPositionTop = "ASToastPositionTop",
    ASToastPositionCenter = "ASToastPositionCenter",
    ASToastPositionBotom = "ASToastPositionBotom"
}

private var timer: Timer!
private var activityView: UIView!

/**
  ASToast view extension
 */
public extension UIView {
    
    // MARK: Make toast methods
    
    /**
      Show a toast with given string
      - parameter message: Message Text
      - parameter backgroundColor: Color for background
      - parameter messageColor: Color for mesage text
     */
    public func makeToast(_ message: String,
                          backgroundColor: UIColor?,
                          messageColor: UIColor?) {
        makeToast(message,
                  duration: Constants.ASToastDuration,
                  position: nil,
                  backgroundColor: backgroundColor,
                  titleColor: nil,
                  messageColor: messageColor)
    }
    
    /**
      Show a toast with given string, duration and position
      - parameter message: Message Text
      - parameter duration: The time duration toast will displayed on the screen
      - parameter position: The position that toast will displayed
      - parameter backgroundColor: Color for background
      - parameter titleColor: Color for title text
      - parameter messageColor: Color for mesage text
     */
    public func makeToast(_ message: String,
                          duration: TimeInterval,
                          position: AnyObject?,
                          backgroundColor: UIColor?,
                          titleColor: UIColor?,
                          messageColor: UIColor?) {
        let toastView = self.toastView(message,
                                       title: "",
                                       image: nil,
                                       backgroundColor: backgroundColor,
                                       titleColor: titleColor,
                                       messageColor: messageColor)
        if toastView != nil {
            self.showToast(toastView,
                           duration: duration,
                           position: position)
        }
    }
    
    /**
      Show a toast with given string, duration, position and title
      - parameter message: Message Text
      - parameter duration: The time duration toast will displayed on the screen
      - parameter position: The position that toast will displayed
      - parameter title: Title for Toast
      - parameter backgroundColor: Color for background
      - parameter titleColor: Color for title text
      - parameter messageColor: Color for mesage text
     */
    public func makeToast(_ message: String,
                          duration: TimeInterval,
                          position: AnyObject?,
                          title: String,
                          backgroundColor: UIColor?,
                          titleColor: UIColor?,
                          messageColor: UIColor?) {
        let toastView = self.toastView(message,
                                       title: title,
                                       image: nil,
                                       backgroundColor: backgroundColor,
                                       titleColor: titleColor,
                                       messageColor: messageColor)
        self.showToast(toastView,
                       duration: duration,
                       position: position)
    }
    
    /**
      Show a toast with given string, duration, position and image
      - parameter message: Message Text
      - parameter duration: The time duration toast will displayed on the screen
      - parameter position: The position that toast will displayed
      - parameter image: Image for Toast
      - parameter backgroundColor: Color for background
      - parameter titleColor: Color for title text
      - parameter messageColor: Color for mesage text
     */
    public func makeToast(_ message: String,
                          duration: TimeInterval,
                          position: AnyObject?,
                          image: UIImage!,
                          backgroundColor: UIColor?,
                          titleColor: UIColor?,
                          messageColor: UIColor?) {
        let toastView = self.toastView(message,
                                       title: "",
                                       image: image,
                                       backgroundColor: backgroundColor,
                                       titleColor: titleColor,
                                       messageColor: messageColor)
        self.showToast(toastView,
                       duration: duration,
                       position: position)
    }
    
    /**
      Show a toast with given string, duration, position, title and image
      - parameter message: Message Text
      - parameter duration: The time duration toast will displayed on the screen
      - parameter position: The position that toast will displayed
      - parameter title: Title for Toast
      - parameter image: Image for Toast
      - parameter backgroundColor: Color for background
      - parameter titleColor: Color for title text
      - parameter messageColor: Color for mesage text
     */
    public func makeToast(_ message: String,
                          duration: TimeInterval,
                          position: AnyObject?,
                          title: String,
                          image: UIImage!,
                          backgroundColor: UIColor?,
                          titleColor: UIColor?,
                          messageColor: UIColor?) {
        let toastView = self.toastView(message,
                                       title: title,
                                       image: image,
                                       backgroundColor: backgroundColor,
                                       titleColor: titleColor,
                                       messageColor: messageColor)
        self.showToast(toastView,
                       duration: duration,
                       position: position)
    }
    
    // MARK: Toast view main methods
    
    /**
      Show toast view with constant duration (3 seconds)
      - parameter toastView: Toast view
     */
    public func showToast(_ toastView: UIView!) {
        showToast(toastView,
                  duration: Constants.ASToastDuration,
                  position: nil)
    }
    
    /**
      Show toast view with duration and position
      - parameter toastView: Toast view
      - parameter duration: The time duration toast will displayed on the screen
      - parameter position: The position that toast will displayed
     */
    public func showToast(_ toastView: UIView!,
                          duration: TimeInterval!,
                          position: AnyObject?) {
        createAndShowToast(toastView,
                           duration: duration,
                           position: position)
    }
    
    /**
      Create and show toast
      - parameter toastView: Toast view
      - parameter duration: The time duration toast will displayed on the screen
      - parameter position: The position that toast will displayed
     */
    fileprivate func createAndShowToast(_ toastView: UIView!,
                                        duration: TimeInterval!,
                                        position: AnyObject?) {
        if toastView == nil {
            return
        }
        toastView.center = centerPointForPosition(position, toastView: toastView)
        toastView.alpha = Constants.ASToastViewAlpha
        
        if Constants.ASToastHidesOnTap {
            let tapRecognizer: UITapGestureRecognizer! = UITapGestureRecognizer(target: toastView, action: #selector(UIView.handleToastTapped(_:)))
            toastView.addGestureRecognizer(tapRecognizer)
            toastView.isUserInteractionEnabled = true
            toastView.isExclusiveTouch = true
        }
        
        timer = Timer.scheduledTimer(timeInterval: duration, target: self, selector: #selector(UIView.toastTimerDidFinish(_:)), userInfo: toastView, repeats: false)
        
        self.addSubview(toastView)
        
        UIView.animate(withDuration: Constants.ASToastDuration, delay: 0.0, options: UIViewAnimationOptions.allowUserInteraction, animations: { () -> Void in
            toastView.alpha = 1.0
        }) { (Bool) -> Void in
            
        }
    }
    
    /**
      Hide toast view
      - parameter toastView: Toast view
     */
    fileprivate func hideToast(_ toastView: UIView!) {
        UIView.animate(withDuration: Constants.ASToastFadeDuration, delay: 0.0, options: [UIViewAnimationOptions.curveEaseIn, UIViewAnimationOptions.beginFromCurrentState], animations: { () -> Void in
            toastView.alpha = 0.0
        }) { (Bool) -> Void in
            toastView.removeFromSuperview()
        }
    }

    /**
      Creates toast view with given message, title and title
      - parameter message: Message Text
      - parameter title: Title for Toast
      - parameter image: Image for Toast
      - parameter backgroundColor: Color for background
      - parameter titleColor: Color for title text
      - parameter messageColor: Color for mesage text
     */
    fileprivate func toastView(_ message: String,
                               title: String,
                               image: UIImage?,
                               backgroundColor: UIColor?,
                               titleColor: UIColor?,
                               messageColor: UIColor?) -> UIView? {
        // check parameters
        if message.isEmpty && title.isEmpty && image == nil {
            return nil
        }
        
        // ui elements of toast
        var messageLabel: UILabel!
        var titleLabel: UILabel!
        var imageView: UIImageView!
        
        let toastView: UIView! = UIView()
        toastView.autoresizingMask = [UIViewAutoresizing.flexibleLeftMargin, UIViewAutoresizing.flexibleRightMargin, UIViewAutoresizing.flexibleTopMargin, UIViewAutoresizing.flexibleBottomMargin]
        toastView.layer.cornerRadius = Constants.ASToastCornerRadius
        
        // check if shadow needed
        if Constants.ASToastDisplayShadow == true {
            toastView.layer.shadowColor = UIColor.black.cgColor
            toastView.layer.shadowOpacity = Constants.ASToastShadowOpacity
            toastView.layer.shadowRadius = Constants.ASToastShadowRadius
            toastView.layer.shadowOffset = Constants.ASToastShadowOffset
        }
        
        // set toastView background color
        if backgroundColor != nil {
            toastView.backgroundColor = backgroundColor!.withAlphaComponent(Constants.ASToastOpacity)
        } else {
            toastView.backgroundColor = UIColor.black.withAlphaComponent(Constants.ASToastOpacity)
        }
        
        // check image
        if(image != nil) {
            imageView = UIImageView(image: image)
            imageView.contentMode = UIViewContentMode.scaleAspectFit
            imageView.frame = CGRect(x: Constants.ASToastHorizontalPadding, y: Constants.ASToastVerticalPadding, width: Constants.ASToastImageViewWidth, height: Constants.ASToastImageViewHeight)
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
            titleLabel.font = UIFont.boldSystemFont(ofSize: Constants.ASToastFontSize)
            titleLabel.textAlignment = NSTextAlignment.center
            titleLabel.textColor = titleColor != nil ? titleColor : UIColor.white
            titleLabel.backgroundColor = UIColor.clear
            titleLabel.alpha = 1.0
            titleLabel.text = title
            
            // set size the title label according to the lenth of title text
            let maxSizeTitle = CGSize(width: (self.bounds.size.width * Constants.ASToastMaxWidth) - imageWidth, height: self.bounds.size.height * Constants.ASToastMaxHeight)
            let expectedSizeTitle: CGSize! = sizeForString(title as NSString, font: titleLabel.font, constrainedSize: maxSizeTitle, lineBreakMode: titleLabel.lineBreakMode)
            titleLabel.frame = CGRect(x: 0.0, y: 0.0, width: expectedSizeTitle.width, height: expectedSizeTitle.height)
        }
        
        // check message string if not empty create message label
        if !message.isEmpty {
            messageLabel = UILabel()
            messageLabel.numberOfLines = Constants.ASToastMaxMessageLines
            messageLabel.font = UIFont.systemFont(ofSize: Constants.ASToastFontSize)
            messageLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            messageLabel.textColor = messageColor != nil ? messageColor : UIColor.white
            messageLabel.backgroundColor = UIColor.clear
            messageLabel.alpha = 1.0
            messageLabel.text = message

            // set size the message label according to the lenth of message text
            let maxSizeMessage = CGSize(width: (self.bounds.size.width * Constants.ASToastMaxWidth) - imageWidth, height: self.bounds.size.height * Constants.ASToastMaxHeight)
            let expectedSizeMessage: CGSize! = sizeForString(message as NSString, font: messageLabel.font, constrainedSize: maxSizeMessage, lineBreakMode: messageLabel.lineBreakMode)
            messageLabel.frame = CGRect(x: 0.0, y: 0.0, width: expectedSizeMessage.width, height: expectedSizeMessage.height)
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
        
        toastView.frame = CGRect(x: 0.0, y: 0.0, width: toastViewWidth, height: toastViewHeight)
        
        if titleLabel != nil {
            titleLabel.frame = CGRect(x: titleLeft, y: titleTop, width: titleWidth, height: titleHeight)
            toastView.addSubview(titleLabel)
        }
        
        if messageLabel != nil {
            messageLabel.frame = CGRect(x: messageLeft, y: messageTop, width: messageWidth, height: messageHeight)
            toastView.addSubview(messageLabel)
        }
        
        if imageView != nil {
            toastView.addSubview(imageView)
        }
        
        return toastView
    }

    // MARK: Toast view events
    
    /**
      Finish event handler for timer
      - parameter timer: NSTimer
     */
    func toastTimerDidFinish(_ timer: Timer) {
        self.hideToast(timer.userInfo as? UIView!)
    }
    
    /**
      Tap gesture handler
      - parameter recognizer: UITapGestureRecognizer
     */
    func handleToastTapped(_ recognizer: UITapGestureRecognizer) {
        timer.invalidate()
        hideToast(recognizer.view)
    }
    
    // MARK: Toast activity methods
    
    /**
      Show a toast with activity indicator
     */
    public func makeToastActivity() {
        makeToastActivity(Constants.ASToastActivityDefaultPosition.rawValue as AnyObject)
    }
    
    /**
      Create toast with given position
      - parameter position: The position that toast will displayed
     */
    fileprivate func makeToastActivity(_ position: AnyObject) {
        activityView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: Constants.ASToastActivityWidth, height: Constants.ASToastActivityHeight))
        activityView.center = centerPointForPosition(position, toastView: activityView)
        activityView.backgroundColor = UIColor.black.withAlphaComponent(Constants.ASToastOpacity)
        activityView.alpha = Constants.ASToastViewAlpha
        activityView.autoresizingMask = [UIViewAutoresizing.flexibleLeftMargin, UIViewAutoresizing.flexibleRightMargin, UIViewAutoresizing.flexibleTopMargin, UIViewAutoresizing.flexibleBottomMargin]
        activityView.layer.cornerRadius = Constants.ASToastCornerRadius
        
        if Constants.ASToastDisplayShadow {
            activityView.layer.shadowColor = UIColor.black.cgColor
            activityView.layer.shadowOpacity = Constants.ASToastShadowOpacity
            activityView.layer.shadowRadius = Constants.ASToastShadowRadius
            activityView.layer.shadowOffset = Constants.ASToastShadowOffset
        }
        
        let activityIndicatorView: UIActivityIndicatorView! = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
        activityIndicatorView.center = CGPoint(x: activityView.bounds.size.width / 2, y: activityView.bounds.size.height / 2)
        activityView.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
        
        self.addSubview(activityView)
        
        UIView.animate(withDuration: Constants.ASToastDuration, delay: 0.0, options: UIViewAnimationOptions(), animations: { () -> Void in
            activityView.alpha = 1.0
        }, completion: nil)
    }
    
    /**
      Hide activity indicator toast
     */
    public func hideToastActivity() {
        if activityView != nil {
            UIView.animate(withDuration: Constants.ASToastFadeDuration, delay: 0.0, options: [UIViewAnimationOptions.curveEaseIn, UIViewAnimationOptions.beginFromCurrentState], animations: { () -> Void in
                activityView.alpha = 0.0
            }, completion: { (Bool) -> Void in
                activityView.removeFromSuperview()
            })
        }
    }
    
    // MARK: Helpers
    
    /**
      Center toast with given point and view
      - parameter point: Position to centralize
      - parameter toastView: Toast view
     */
    fileprivate func centerPointForPosition(_ point: AnyObject?, toastView: UIView!) -> CGPoint {
        if point != nil {
            if point! is String {
                if point!.caseInsensitiveCompare(ASToastPosition.ASToastPositionTop.rawValue) == ComparisonResult.orderedSame {
                    return CGPoint(x: self.bounds.size.width / 2, y: (toastView.frame.size.height / 2) + Constants.ASToastVerticalPadding)
                } else if point!.caseInsensitiveCompare(ASToastPosition.ASToastPositionCenter.rawValue) == ComparisonResult.orderedSame {
                    return CGPoint(x: self.bounds.size.width / 2, y: self.bounds.size.height / 2)
                }
            } else if point! is NSValue {
                return point!.cgPointValue
            }
        }
        
        // default bottom option
        return CGPoint(x: self.bounds.size.width / 2, y: (self.bounds.size.height - (toastView.frame.size.height / 2)) - Constants.ASToastVerticalPadding)
    }
    
    /**
      Calculates string size with given text, font, constrained and mode
      - parameter text: Toast view message
      - parameter font: UIFont used for text
      - parameter constrainedSize: CGSize
      - parameter lineBreakMode: NSLineBreakMode
     */
    fileprivate func sizeForString(_ text: NSString,
                                   font: UIFont,
                                   constrainedSize: CGSize,
                                   lineBreakMode: NSLineBreakMode) -> CGSize {
        if text.responds(to: #selector(NSString.boundingRect(with:options:attributes:context:))) {
            let paragraphStyle: NSMutableParagraphStyle! = NSMutableParagraphStyle()
            paragraphStyle.lineBreakMode = lineBreakMode
            let attributes: Dictionary = [NSFontAttributeName: font, NSParagraphStyleAttributeName: paragraphStyle] as [String : Any]
            let boundingRect: CGRect! = text.boundingRect(with: constrainedSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil)
            return CGSize(width: boundingRect.size.width, height: boundingRect.size.height)
        }
        
        return CGSize(width: 0.0, height: 0.0)
    }
    
}
