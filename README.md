![Build Status](https://travis-ci.org/abdullahselek/ASToast.svg?branch=master)
![CocoaPods Compatible](https://img.shields.io/cocoapods/v/ASToast.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Coverage Status](https://coveralls.io/repos/github/abdullahselek/ASToast/badge.svg?branch=master)](https://coveralls.io/github/abdullahselek/ASToast?branch=master)

# ASToast
A Swift extension for using Android style Toast notifications. You may call ASToast methods directly from your view objects.

## Screenshots

![single_toast](https://github.com/abdullahselek/ASToast/blob/master/images/astoast_singletoast.png)
![image_toast](https://github.com/abdullahselek/ASToast/blob/master/images/astoast_image_title_text_toast.png)
![activity_toast](https://github.com/abdullahselek/ASToast/blob/master/images/astoast_activity.png)

## Requirements
iOS 8.0+

## CocoaPods

CocoaPods is a dependency manager for Cocoa projects. You can install it with the following command:
```	
$ gem install cocoapods
```

### For Swift 3
```
You can use > 1.0.4
```
### For Swift 2.3
```
Please use 1.0.3
```

To integrate ASToast into your Xcode project using CocoaPods, specify it in your Podfile:
```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'ASToast', '~> 1.0.9'
end
```
Then, run the following command:
```
$ pod install
```
## Carthage

Carthage is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with Homebrew using the following command:

```
brew update
brew install carthage
```

To integrate ASToast into your Xcode project using Carthage, specify it in your Cartfile:

```
github "abdullahselek/ASToast" ~> 1.0.9
```

Run carthage update to build the framework and drag the built ASToast.framework into your Xcode project.

## Example Usage

make a toast with single text with default background color and custom message color
```
self.view.makeToast(message: "Single text toast",
					backgroundColor: nil,
					messageColor: UIColor.cyan)
```
make a toast with custom background color white message color
```
self.view.makeToast(message: "Single text toast",
					backgroundColor: UIColor.blue,
					messageColor: nil)
```
make a toast with text, title, position, duration and custom colors
```
self.view.makeToast(message: "Toast with custom text, title and duration",
					duration: TimeInterval(3.0),
					position: .center,
					title: "Title",
					backgroundColor: UIColor.blue,
					titleColor: UIColor.yellow,
					messageColor: UIColor.yellow,
					font: nil)
``` 	
make toast with an image and custom colors
```
self.view.makeToast(message: "Toast with an image",
					duration: TimeInterval(3.0),
					position: .top,
					image: UIImage(named: "apple_logo"),
					backgroundColor: UIColor.blue,
					titleColor: UIColor.yellow,
					messageColor: UIColor.yellow)
```	
Show a custom view as toast
```
let customView: UIView! = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 300.0))
customView.autoresizingMask = [UIViewAutoresizing.flexibleLeftMargin,
							   UIViewAutoresizing.flexibleRightMargin,
							   UIViewAutoresizing.flexibleTopMargin,
							   UIViewAutoresizing.flexibleBottomMargin]
customView.backgroundColor = UIColor.green

self.view.showToast(toastView: customView,
					duration: TimeInterval(3.0),
					position: .bottom)
```

Show an imageView as toast, on center at point (110,110)
```
let toastImageView: UIImageView! = UIImageView(image: UIImage(named: "apple_logo"))
self.view.showToast(toastView: toastImageView,
					duration: TimeInterval(3.0),
					point: CGPoint(x: 110, y: 110))
```

Show activity indicator
```
self.view.makeToastActivity()
```

Hide activity indicator
```
self.view.hideToastActivity()
```
	
## MIT License
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

## Credits
```
Inspired from Charles Scalesse (scalessec). Improved and all coded in new programming 
language Swift.
```
	


