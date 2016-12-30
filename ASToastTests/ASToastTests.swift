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
        describe(".makeToast with single text") {
            context("Toast view display success") {
                it("set a valid message") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast("TEST",
                                    backgroundColor: nil,
                                    messageColor: UIColor.cyan)
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("Toast view display fails") {
                it("set a empty message") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast("",
                                    backgroundColor: UIColor.green,
                                    messageColor: nil)
                    expect(view?.subviews.count).to(equal(0))
                }
            }
        }
        describe(".makeToast with message, duration, position") {
            context("Toast view display success with 3 parameters") {
                it("set valid message, duration and position") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast("TEST",
                                    duration: TimeInterval(3.0),
                                    position: ASToastPosition.ASToastPositionCenter.rawValue as AnyObject,
                                    backgroundColor: nil,
                                    titleColor: UIColor.cyan,
                                    messageColor: UIColor.yellow)
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("Toast view display success with 3 parameters when position is invalid") {
                it("set a invalid position, valid text and duration") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast("TEST",
                                    duration: TimeInterval(3.0),
                                    position: nil,
                                    backgroundColor: UIColor.blue,
                                    titleColor: UIColor.cyan,
                                    messageColor: nil)
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("Toast view display fails with 3 parameters when text is empty") {
                it("set a empty text, valid duration and valid position") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast("",
                                    duration: TimeInterval(3.0),
                                    position: ASToastPosition.ASToastPositionCenter.rawValue as AnyObject,
                                    backgroundColor: UIColor.blue,
                                    titleColor: UIColor.cyan,
                                    messageColor: UIColor.yellow)
                    expect(view?.subviews.count).to(equal(0))
                }
            }
        }
        describe(".makeToast with message, duration, position and title") {
            context("Toast view diplays success with 4 valid parameters") {
                it("set valid message, duration, position and title") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast("TEST",
                                    duration: TimeInterval(3.0),
                                    position: ASToastPosition.ASToastPositionCenter.rawValue as AnyObject,
                                    title: "TITLE",
                                    backgroundColor: nil,
                                    titleColor: nil,
                                    messageColor: nil)
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("Toast view display success with 4 parameters when text is empty") {
                it("set empty message, duration, position and title") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast("",
                                    duration: TimeInterval(3.0),
                                    position: ASToastPosition.ASToastPositionCenter.rawValue as AnyObject,
                                    title: "TITLE",
                                    backgroundColor: UIColor.blue,
                                    titleColor: UIColor.cyan,
                                    messageColor: UIColor.yellow)
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("Toast view display success with 4 parameters when title is empty") {
                it("set message, duration, position and empty title") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast("TEST",
                                    duration: TimeInterval(3.0),
                                    position: ASToastPosition.ASToastPositionCenter.rawValue as AnyObject,
                                    title: "",
                                    backgroundColor: UIColor.blue,
                                    titleColor: nil,
                                    messageColor: nil)
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("Toast view display success with 4 parameters when position empty") {
                it("set message, duration, position and empty title") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast("TEST",
                                    duration: TimeInterval(3.0),
                                    position: "" as AnyObject,
                                    title: "TITLE",
                                    backgroundColor: nil,
                                    titleColor: UIColor.cyan,
                                    messageColor: UIColor.yellow)
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("Toast view display fails with 4 parameters when mesage and title empty") {
                it("set message, duration, position and empty title") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast("",
                                    duration: TimeInterval(3.0),
                                    position: ASToastPosition.ASToastPositionCenter.rawValue as AnyObject,
                                    title: "",
                                    backgroundColor: UIColor.blue,
                                    titleColor: nil,
                                    messageColor: nil)
                    expect(view?.subviews.count).to(equal(0))
                }
            }
        }
        describe(".makeToast with message, duration, position and image") {
            context("Toast view diplay success with 4 valid parameters") {
                it("set valid message, duration, position and image") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast("TEST",
                                    duration: TimeInterval(3.0),
                                    position: ASToastPosition.ASToastPositionCenter.rawValue as AnyObject,
                                    image: UIImage(named: "apple_logo.png"),
                                    backgroundColor: nil,
                                    titleColor: UIColor.cyan,
                                    messageColor: UIColor.yellow)
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("Toast view diplay success with duration, position, image and empty message") {
                it("set duration, position, image and empty message") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast("",
                                    duration: TimeInterval(3.0),
                                    position: ASToastPosition.ASToastPositionCenter.rawValue as AnyObject,
                                    image: UIImage(named: "apple_logo.png"),
                                    backgroundColor: UIColor.blue,
                                    titleColor: nil,
                                    messageColor: nil)
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("Toast view diplay success with message, duration, image and empty position") {
                it("set message, duration, position and empty image") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast("TEST",
                                    duration: TimeInterval(3.0),
                                    position: "" as AnyObject,
                                    image: UIImage(named: "apple_logo.png"),
                                    backgroundColor: nil,
                                    titleColor: UIColor.cyan,
                                    messageColor: UIColor.yellow)
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("Toast view diplay fails with duration, position, empty message and image") {
                it("set message, duration, position and empty image") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast("",
                                    duration: TimeInterval(3.0),
                                    position: ASToastPosition.ASToastPositionCenter.rawValue as AnyObject,
                                    image: UIImage(named: ""),
                                    backgroundColor: UIColor.blue,
                                    titleColor: nil,
                                    messageColor: nil)
                    expect(view?.subviews.count).to(equal(0))
                }
            }
        }
        describe(".makeToast with message, duration, position, title and image") {
            context("Toast view diplay success with 5 valid parameters") {
                it("set valid message, duration, position, title and image") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast("TEST",
                                    duration: TimeInterval(3.0),
                                    position: ASToastPosition.ASToastPositionCenter.rawValue as AnyObject,
                                    title: "TITLE",
                                    image: UIImage(named: "apple_logo.png"),
                                    backgroundColor: nil,
                                    titleColor: UIColor.cyan,
                                    messageColor: UIColor.yellow)
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("Toast view diplay success with message, duration, position, image and empty title") {
                it("set valid message, duration, position, title and image") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast("TEST",
                                    duration: TimeInterval(3.0),
                                    position: ASToastPosition.ASToastPositionCenter.rawValue as AnyObject,
                                    title: "",
                                    image: UIImage(named: "apple_logo.png"),
                                    backgroundColor: UIColor.blue,
                                    titleColor: nil,
                                    messageColor: nil)
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("Toast view diplay success with message, title, duration, position and empty image") {
                it("set valid message, duration, position, title and image") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast("TEST",
                                    duration: TimeInterval(3.0),
                                    position: ASToastPosition.ASToastPositionCenter.rawValue as AnyObject,
                                    title: "",
                                    image: UIImage(named: ""),
                                    backgroundColor: nil,
                                    titleColor: UIColor.cyan,
                                    messageColor: UIColor.yellow)
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("Toast view diplay success with message, title, duration, image and empty position") {
                it("set valid message, duration, position, title and image") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast("TEST",
                                    duration: TimeInterval(3.0),
                                    position: "" as AnyObject,
                                    title: "",
                                    image: UIImage(named: ""),
                                    backgroundColor: UIColor.blue,
                                    titleColor: nil,
                                    messageColor: nil)
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("Toast view diplay success with duration, position, image and empty message, title") {
                it("set valid message, duration, position, title and image") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast("",
                                    duration: TimeInterval(3.0),
                                    position: ASToastPosition.ASToastPositionCenter.rawValue as AnyObject,
                                    title: "",
                                    image: UIImage(named: "apple_logo.png"),
                                    backgroundColor: UIColor.blue,
                                    titleColor: UIColor.cyan,
                                    messageColor: UIColor.yellow)
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("Toast view diplay fails with duration, position and empty message, title, image") {
                it("set valid message, duration, position, title and image") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToast("",
                                    duration: TimeInterval(3.0),
                                    position: ASToastPosition.ASToastPositionCenter.rawValue as AnyObject,
                                    title: "",
                                    image: UIImage(named: ""),
                                    backgroundColor: UIColor.blue,
                                    titleColor: nil,
                                    messageColor: nil)
                    expect(view?.subviews.count).to(equal(0))
                }
            }
        }
        describe(".showToast with view") {
            context("Toast view display success with view") {
                it("set valid view") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    let toastView = UIView()
                    view!.showToast(toastView)
                    expect(view?.subviews.count).to(equal(1))
                }
            }
        }
        describe(".showToast with toastView, duration, position") {
            context("Toast view display success with toastView, duration and position") {
                it("set valid toastView, duration and position") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    let toastView = UIView()
                    view!.showToast(toastView,
                                    duration: TimeInterval(3.0),
                                    position: ASToastPosition.ASToastPositionCenter.rawValue as AnyObject)
                    expect(view?.subviews.count).to(equal(1))
                }
            }
            context("Toast view display success with toastView, duration and empty position") {
                it("set valid toastView, duration and empty position") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    let toastView = UIView()
                    view!.showToast(toastView,
                                    duration: TimeInterval(3.0),
                                    position: "" as AnyObject)
                    expect(view?.subviews.count).to(equal(1))
                }
            }
        }
        describe(".makeToastActivity") {
            context("Toast Activity display success") {
                it("Call makeToastActivity") {
                    let viewController = UIViewController()
                    let view = viewController.view
                    view!.makeToastActivity()
                    expect(view?.subviews.count).to(equal(1))
                }
            }
        }
        describe(".hideToastActivity") {
            context("Toast Activity dismiss success") {
                it("Call hideToastActivity") {
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
