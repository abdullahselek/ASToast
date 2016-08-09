![Build Status](https://travis-ci.org/abdullahselek/ASToast.svg?branch=master)
![CocoaPods Compatible](https://img.shields.io/cocoapods/v/ASToast.svg)

# ASToast
A Swift extension for using Android style Toast notifications. You may call ASToast methods directly from your view objects.

# Screenshots

![single_toast](https://github.com/abdullahselek/ASToast/blob/master/images/astoast_singletoast.png)
![image_toast](https://github.com/abdullahselek/ASToast/blob/master/images/astoast_image_title_text_toast.png)
![activity_toast](https://github.com/abdullahselek/ASToast/blob/master/images/astoast_activity.png)

# Requirements
iOS 8.0+

# CocoaPods

CocoaPods is a dependency manager for Cocoa projects. You can install it with the following command:
```	
$ gem install cocoapods
```

To integrate ASToast into your Xcode project using CocoaPods, specify it in your Podfile:
```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'ASToast', '~> 1.0'
end
```
Then, run the following command:
```
$ pod install
```
# Example Usage

make a toast with single text
```objc
self.view.makeToast("Single text toast", backgroundColor: UIColor.blueColor())
```
or to use default black color
```objc
self.view.makeToast("Single text toast", backgroundColor: nil)
```
make a toast with text, title, position and duration
```objc
self.view.makeToast("Toast with custom text, title and duration", duration: NSTimeInterval(3.0), 
    	position: ASToastPosition.ASToastPositionCenter.rawValue, title: "Title", backgroundColor: UIColor.blueColor())
``` 	
make toast with an image
```objc
self.view.makeToast("Toast with an image", duration: NSTimeInterval(3.0), 
		position: ASToastPosition.ASToastPositionTop.rawValue, 
		image: UIImage(named: "apple_logo"), backgroundColor: UIColor.blueColor())
```	
Show a custom view as toast
```objc
var customView: UIView! = UIView(frame: CGRectMake(0.0, 0.0, 200.0, 300.0))
customView.autoresizingMask = UIViewAutoresizing.FlexibleLeftMargin | UIViewAutoresizing.FlexibleRightMargin | 
		UIViewAutoresizing.FlexibleTopMargin | UIViewAutoresizing.FlexibleBottomMargin
customView.backgroundColor = UIColor.greenColor()
self.view.showToast(customView, duration: NSTimeInterval(3.0), position: ASToastPosition.ASToastPositionCenter.rawValue)
```
	
Show activity indicator
```objc
self.view.makeToastActivity()
```
	
# MIT License
```
Copyright (c) 2015 Abdullah Selek

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

# Credits
```
Inspired from Charles Scalesse (scalessec). Improved and all coded in new programming 
language Swift.
```
	


