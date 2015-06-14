# ASToast
A Swift extension for using Android style Toast notifications. You may call ASToast methods directly from your view objects.

# Screenshots

![single_toast](https://github.com/abdullahselek/ASToast/blob/master/images/astoast_singletoast.png)
![image_toast](https://github.com/abdullahselek/ASToast/blob/master/images/astoast_image_title_text_toast.png)
![activity_toast](https://github.com/abdullahselek/ASToast/blob/master/images/astoast_activity.png)

# Example Usage

	// make a toast with single text
    self.view.makeToast("Single text toast")
    
    // make a toast with text, title, position and duration
    self.view.makeToast("Toast with custom text, title and duration", duration: NSTimeInterval(3.0), 
    	position: ASToastPosition.ASToastPositionCenter.rawValue, title: "Title")
    	
    // Make toast with an image
	self.view.makeToast("Toast with an image", duration: NSTimeInterval(3.0), 
		position: ASToastPosition.ASToastPositionTop.rawValue, image: UIImage(named: "apple_logo"))
		
	// Show a custom view as toast
	var customView: UIView! = UIView(frame: CGRectMake(0.0, 0.0, 200.0, 300.0))
	customView.autoresizingMask = UIViewAutoresizing.FlexibleLeftMargin | UIViewAutoresizing.FlexibleRightMargin | 
		UIViewAutoresizing.FlexibleTopMargin | UIViewAutoresizing.FlexibleBottomMargin
	customView.backgroundColor = UIColor.greenColor()

	self.view.showToast(customView, duration: NSTimeInterval(3.0), position: ASToastPosition.ASToastPositionCenter.rawValue)
	
	// Show activity indicator
	self.view.makeToastActivity()
	
# MIT License
	
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

# Credits

	Inspired from Charles Scalesse (scalessec). Improved and all coded in new programming 
	language Swift.
	


