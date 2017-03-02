//
//  ASToastTests.swift
//  ASToast
//
//  Created by Abdullah Selek on 06/08/16.
//  Copyright © 2016 Abdullah Selek. All rights reserved.
//

import UIKit
import Quick
import Nimble

@testable import ASToast

class ASToastTests: QuickSpec {

    override func spec() {
        describe("-makeToast") {
            context("with just a message and message color") {
                it("should display a toast") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast(message: "TEST",
                                    backgroundColor: nil,
                                    messageColor: UIColor.cyan)
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("with an empty message and background color") {
                it("should not display a toast") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast(message: "",
                                    backgroundColor: UIColor.green,
                                    messageColor: nil)
                    expect(view?.subviews.count).to(equal(0))
                }
            }
            context("with message, duration, background and message color") {
                it("should display a toast") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast(message: "TEST",
                                    duration: TimeInterval(3.0),
                                    backgroundColor: UIColor.blue,
                                    messageColor: UIColor.white)
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("with message, duration, position, background - message color and font") {
                it("should display a toast") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast(message: "TEST",
                                    duration: TimeInterval(3.0),
                                    position: .top,
                                    backgroundColor: UIColor.blue,
                                    messageColor: UIColor.white,
                                    font: UIFont.systemFont(ofSize: 16))
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("with empty message, duration, position, title") {
                it("should not display a toast") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast(message: "",
                                    duration: TimeInterval(3.0),
                                    position: .bottom,
                                    backgroundColor: UIColor.blue,
                                    messageColor: UIColor.yellow,
                                    font: UIFont.systemFont(ofSize: 16))
                    expect(view?.subviews.count).to(equal(0))
                }
            }
            context("with message, duration, position and title") {
                it("should display a toast") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast(message: "TEST",
                                    duration: TimeInterval(3.0),
                                    position: .center,
                                    title: "TITLE",
                                    backgroundColor: nil,
                                    titleColor: nil,
                                    messageColor: nil,
                                    font: nil)
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("with message, duration, position, title, background - title - message color and font") {
                it("should display a toast") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast(message: "",
                                    duration: TimeInterval(3.0),
                                    position: .top,
                                    title: "TITLE",
                                    backgroundColor: UIColor.blue,
                                    titleColor: UIColor.cyan,
                                    messageColor: UIColor.yellow,
                                    font: UIFont.systemFont(ofSize: 16))
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("with message, duration, position, title and background color") {
                it("should display a toast") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast(message: "TEST",
                                    duration: TimeInterval(3.0),
                                    position: .bottom,
                                    title: "",
                                    backgroundColor: UIColor.blue,
                                    titleColor: nil,
                                    messageColor: nil,
                                    font: nil)
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("with message, duration, position, title, title - message color and font") {
                it("should display a toast") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast(message: "TEST",
                                    duration: TimeInterval(3.0),
                                    position: .center,
                                    title: "TITLE",
                                    backgroundColor: nil,
                                    titleColor: UIColor.cyan,
                                    messageColor: UIColor.yellow,
                                    font: UIFont.systemFont(ofSize: 16))
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("with empty message, duration, position, empty title, backgroun color and font") {
                it("should not display a toast") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast(message: "",
                                    duration: TimeInterval(3.0),
                                    position: .top,
                                    title: "",
                                    backgroundColor: UIColor.blue,
                                    titleColor: nil,
                                    messageColor: nil,
                                    font: UIFont.systemFont(ofSize: 16))
                    expect(view?.subviews.count).to(equal(0))
                }
            }
            context("with message, duration, position, image, title - message color and font") {
                it("should display a toast") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast(message: "TEST",
                                    duration: TimeInterval(3.0),
                                    position: .bottom,
                                    image: UIImage(named: "apple_logo.png"),
                                    backgroundColor: nil,
                                    titleColor: UIColor.cyan,
                                    messageColor: UIColor.yellow,
                                    font: UIFont.systemFont(ofSize: 16))
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("with message, duration, position, image and background color") {
                it("should display a toast") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast(message: "",
                                    duration: TimeInterval(3.0),
                                    position: .center,
                                    image: UIImage(named: "apple_logo.png"),
                                    backgroundColor: UIColor.blue,
                                    titleColor: nil,
                                    messageColor: nil,
                                    font: nil)
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("with message, duration, image, title - message color and font") {
                it("should display a toast") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast(message: "TEST",
                                    duration: TimeInterval(3.0),
                                    position: .top,
                                    image: UIImage(named: "apple_logo.png"),
                                    backgroundColor: nil,
                                    titleColor: UIColor.cyan,
                                    messageColor: UIColor.yellow,
                                    font: UIFont.systemFont(ofSize: 16))
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("with empty message, duration, position, background color and font") {
                it("should not display a toast") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast(message: "",
                                    duration: TimeInterval(3.0),
                                    position: .bottom,
                                    image: UIImage(named: ""),
                                    backgroundColor: UIColor.blue,
                                    titleColor: nil,
                                    messageColor: nil,
                                    font: UIFont.systemFont(ofSize: 16))
                    expect(view?.subviews.count).to(equal(0))
                }
            }
            context("with message, duration, position, image, title - message color and font") {
                it("should display a toast") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast(message: "TEST",
                                    duration: TimeInterval(3.0),
                                    position: .center,
                                    title: "TITLE",
                                    image: UIImage(named: "apple_logo.png"),
                                    backgroundColor: nil,
                                    titleColor: UIColor.cyan,
                                    messageColor: UIColor.yellow,
                                    font: UIFont.systemFont(ofSize: 16))
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("with message, duration, position, image, background color and font") {
                it("should display a toast") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast(message: "TEST",
                                    duration: TimeInterval(3.0),
                                    position: .top,
                                    title: "",
                                    image: UIImage(named: "apple_logo.png"),
                                    backgroundColor: UIColor.blue,
                                    titleColor: nil,
                                    messageColor: nil,
                                    font: UIFont.systemFont(ofSize: 16))
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("with message, durationi position, title - message color and font") {
                it("should display a toast") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast(message: "TEST",
                                    duration: TimeInterval(3.0),
                                    position: .bottom,
                                    title: "",
                                    image: UIImage(named: ""),
                                    backgroundColor: nil,
                                    titleColor: UIColor.cyan,
                                    messageColor: UIColor.yellow,
                                    font: UIFont.systemFont(ofSize: 16))
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("with message, duration, position, image, background color and font") {
                it("should display a toast") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast(message: "TEST",
                                    duration: TimeInterval(3.0),
                                    position: .center,
                                    title: "",
                                    image: UIImage(named: ""),
                                    backgroundColor: UIColor.blue,
                                    titleColor: nil,
                                    messageColor: nil,
                                    font: UIFont.systemFont(ofSize: 16))
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("with duration, position, image, background - title - message color and font") {
                it("should display a toast") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast(message: "",
                                    duration: TimeInterval(3.0),
                                    position: .top,
                                    title: "",
                                    image: UIImage(named: "apple_logo.png"),
                                    backgroundColor: UIColor.blue,
                                    titleColor: UIColor.cyan,
                                    messageColor: UIColor.yellow,
                                    font: UIFont.systemFont(ofSize: 16))
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("with empty message, duration, position, background color and font") {
                it("should not display a toast") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast(message: "",
                                    duration: TimeInterval(3.0),
                                    position: .bottom,
                                    title: "",
                                    image: UIImage(named: ""),
                                    backgroundColor: UIColor.blue,
                                    titleColor: nil,
                                    messageColor: nil,
                                    font: UIFont.systemFont(ofSize: 16))
                    expect(view?.subviews.count).to(equal(0))
                }
            }
            context("with message, duration, backgroundColor and messageColor") {
                it("should display a toast", closure: {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast(message: "TEST",
                                    duration: TimeInterval(3.0),
                                    backgroundColor: UIColor.blue,
                                    messageColor: UIColor.white)
                    expect(view?.subviews.count).to(equal(1))
                })
            }
            context("with message, title, duration, backgroundColor, titleColor and messageColor") {
                it("should display a toast", closure: {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast(message: "TEST",
                                    title: "TITLE",
                                    backgroundColor: UIColor.blue,
                                    titleColor: UIColor.yellow,
                                    messageColor: UIColor.white,
                                    font: UIFont.systemFont(ofSize: 16))
                    expect(view?.subviews.count).to(equal(1))
                })
            }
            context("with message, duration, title, duration, backgroundColor, titleColor and messageColor") {
                it("should display a toast", closure: {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast(message: "TEST",
                                    duration: TimeInterval(3.0),
                                    title: "TITLE",
                                    backgroundColor: UIColor.blue,
                                    titleColor: UIColor.yellow,
                                    messageColor: UIColor.white,
                                    font: UIFont.systemFont(ofSize: 16))
                    expect(view?.subviews.count).to(equal(1))
                })
            }
            context("makeToast with message, background color, message color and font") {
                it("should display a toast", closure: {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view?.makeToast(message: "MESSAGE",
                                    backgroundColor: UIColor.blue,
                                    messageColor: UIColor.white,
                                    font: UIFont.systemFont(ofSize: 16))
                    expect(view?.subviews.count).to(equal(1))
                })
            }
        }
        describe("-showToast") {
            context("with a view") {
                it("should display a toast") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    let toastView = UIView()
                    view!.showToast(toastView: toastView)
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("with view, duratiın and center position") {
                it("should display a toast") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    let toastView = UIView()
                    view!.showToast(toastView: toastView,
                                    duration: TimeInterval(3.0),
                                    position: .center)
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("with view, duration and top position") {
                it("should display a toast") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    let toastView = UIView()
                    view!.showToast(toastView: toastView,
                                    duration: TimeInterval(3.0),
                                    position: .top)
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("with view with point") {
                it("should display a toast", closure: {
                    let viewController = UIViewController()
                    let view = viewController.view
                    let toastView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
                    view!.showToast(toastView: toastView, point: CGPoint(x: 10, y: 10))
                    expect(view?.subviews.count).to(equal(1))
                })
            }
            context("with view with duration and point") {
                it("should display a toast", closure: {
                    let viewController = UIViewController()
                    let view = viewController.view
                    let toastView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
                    view!.showToast(toastView: toastView, duration: TimeInterval(3.0), point: CGPoint(x: 10, y: 10))
                    expect(view?.subviews.count).to(equal(1))
                })
            }
        }
        describe("-makeToastActivity") {
            context("when called") {
                it("should display activity toast") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToastActivity()
                    expect(view?.subviews.count).to(equal(1))
                }
            }
        }
        describe("-hideToastActivity") {
            context("when called") {
                it("should hide activity toast") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToastActivity()
                    expect(view?.subviews.count).to(equal(1))
                    view!.hideToastActivity()
                }
            }
        }
    }

}
