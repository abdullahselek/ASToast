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
        describe("ASToast Tests") {
            var view: UIView!

            beforeEach {
                let viewController = UIViewController()
                view = viewController.view
            }

            describe(".makeToast(message:backgroundColor:messageColor:)", { 
                context("when message not empty") {
                    beforeEach {
                        view.makeToast(message: "TEST",
                                        backgroundColor: nil,
                                        messageColor: UIColor.cyan)
                    }

                    it("should display a toast") {
                        expect(view?.subviews.count).to(equal(1))
                    }
                }

                context("when message empty") {
                    beforeEach {
                        view.makeToast(message: "",
                                        backgroundColor: UIColor.green,
                                        messageColor: nil)
                    }

                    it("should not display a toast") {
                        expect(view?.subviews.count).to(equal(0))
                    }
                }
            })

            context(".makeToast(message:fadeIn:duration:backgroundColor:messageColor:)") {
                beforeEach {
                    view.makeToast(message: "TEST",
                                    duration: TimeInterval(3.0),
                                    backgroundColor: UIColor.blue,
                                    messageColor: UIColor.white)
                }

                it("should display a toast") {
                    expect(view?.subviews.count).to(equal(1))
                }
            }

            describe(".makeToast(message:fadeIn:duration:position:backgroundColor:messageColor:font:)", {
                context("when message not empty") {
                    beforeEach {
                        view.makeToast(message: "TEST",
                                        duration: TimeInterval(3.0),
                                        position: .top,
                                        backgroundColor: UIColor.blue,
                                        messageColor: UIColor.white,
                                        font: UIFont.systemFont(ofSize: 16))
                    }

                    it("should display a toast") {
                        expect(view?.subviews.count).to(equal(1))
                    }
                }

                context("when message empty") {
                    beforeEach {
                        view.makeToast(message: "",
                                        duration: TimeInterval(3.0),
                                        position: .bottom,
                                        backgroundColor: UIColor.blue,
                                        messageColor: UIColor.yellow,
                                        font: UIFont.systemFont(ofSize: 16))
                    }

                    it("should not display a toast") {
                        expect(view?.subviews.count).to(equal(0))
                    }
                }
            })

            describe("makeToast(message:fadeIn:duration:position:title:backgroundColor:titleColor:messageColor:font:)", { 
                context("with message, duration, position and title") {
                    beforeEach {
                        view.makeToast(message: "TEST",
                                        duration: TimeInterval(3.0),
                                        position: .center,
                                        title: "TITLE",
                                        backgroundColor: nil,
                                        titleColor: nil,
                                        messageColor: nil,
                                        font: nil)
                    }

                    it("should display a toast") {
                        expect(view?.subviews.count).to(equal(1))
                    }
                }

                context("with message, duration, position, title, background - title - message color and font") {
                    beforeEach {
                        view.makeToast(message: "",
                                        duration: TimeInterval(3.0),
                                        position: .top,
                                        title: "TITLE",
                                        backgroundColor: UIColor.blue,
                                        titleColor: UIColor.cyan,
                                        messageColor: UIColor.yellow,
                                        font: UIFont.systemFont(ofSize: 16))
                    }

                    it("should display a toast") {
                        expect(view?.subviews.count).to(equal(1))
                    }
                }

                context("with message, duration, position, title and background color") {
                    beforeEach {
                        view.makeToast(message: "TEST",
                                        duration: TimeInterval(3.0),
                                        position: .bottom,
                                        title: "",
                                        backgroundColor: UIColor.blue,
                                        titleColor: nil,
                                        messageColor: nil,
                                        font: nil)
                    }

                    it("should display a toast") {
                        expect(view?.subviews.count).to(equal(1))
                    }
                }

                context("with message, duration, position, title, title - message color and font") {
                    beforeEach {
                        view.makeToast(message: "TEST",
                                        duration: TimeInterval(3.0),
                                        position: .center,
                                        title: "TITLE",
                                        backgroundColor: nil,
                                        titleColor: UIColor.cyan,
                                        messageColor: UIColor.yellow,
                                        font: UIFont.systemFont(ofSize: 16))
                    }

                    it("should display a toast") {
                        expect(view?.subviews.count).to(equal(1))
                    }
                }

                context("with empty message, duration, position, empty title, backgroun color and font") {
                    beforeEach {
                        view.makeToast(message: "",
                                        duration: TimeInterval(3.0),
                                        position: .top,
                                        title: "",
                                        backgroundColor: UIColor.blue,
                                        titleColor: nil,
                                        messageColor: nil,
                                        font: UIFont.systemFont(ofSize: 16))
                    }

                    it("should not display a toast") {
                        expect(view?.subviews.count).to(equal(0))
                    }
                }
            })

            describe(".makeToast(message:fadeIn:duration:position:image:backgroundColor:titleColor:messageColor:font:)", {
                context("with message, duration, position, image, title - message color and font") {
                    beforeEach {
                        view.makeToast(message: "TEST",
                                        duration: TimeInterval(3.0),
                                        position: .bottom,
                                        image: UIImage(named: "apple_logo.png"),
                                        backgroundColor: nil,
                                        titleColor: UIColor.cyan,
                                        messageColor: UIColor.yellow,
                                        font: UIFont.systemFont(ofSize: 16))
                    }

                    it("should display a toast") {
                        expect(view?.subviews.count).to(equal(1))
                    }
                }

                context("with message, duration, position, image and background color") {
                    beforeEach {
                        view.makeToast(message: "",
                                        duration: TimeInterval(3.0),
                                        position: .center,
                                        image: UIImage(named: "apple_logo.png"),
                                        backgroundColor: UIColor.blue,
                                        titleColor: nil,
                                        messageColor: nil,
                                        font: nil)
                    }

                    it("should display a toast") {
                        expect(view?.subviews.count).to(equal(1))
                    }
                }

                context("with message, duration, image, title - message color and font") {
                    beforeEach {
                        view.makeToast(message: "TEST",
                                        duration: TimeInterval(3.0),
                                        position: .top,
                                        image: UIImage(named: "apple_logo.png"),
                                        backgroundColor: nil,
                                        titleColor: UIColor.cyan,
                                        messageColor: UIColor.yellow,
                                        font: UIFont.systemFont(ofSize: 16))
                    }

                    it("should display a toast") {
                        expect(view?.subviews.count).to(equal(1))
                    }
                }
            })

            describe(".makeToast(message:fadeIn:duration:position:title:image:backgroundColor:titleColor:messageColor:font:)", {
                context("with message, duration, position, image, title - message color and font") {
                    beforeEach {
                        view.makeToast(message: "TEST",
                                        duration: TimeInterval(3.0),
                                        position: .center,
                                        title: "TITLE",
                                        image: UIImage(named: "apple_logo.png"),
                                        backgroundColor: nil,
                                        titleColor: UIColor.cyan,
                                        messageColor: UIColor.yellow,
                                        font: UIFont.systemFont(ofSize: 16))
                    }

                    it("should display a toast") {
                        expect(view?.subviews.count).to(equal(1))
                    }
                }
                context("with message, duration, position, image, background color and font") {
                    beforeEach {
                        view.makeToast(message: "TEST",
                                        duration: TimeInterval(3.0),
                                        position: .top,
                                        title: "",
                                        image: UIImage(named: "apple_logo.png"),
                                        backgroundColor: UIColor.blue,
                                        titleColor: nil,
                                        messageColor: nil,
                                        font: UIFont.systemFont(ofSize: 16))
                    }

                    it("should display a toast") {
                        expect(view?.subviews.count).to(equal(1))
                    }
                }
                context("with message, durationi position, title - message color and font") {
                    beforeEach {
                        view.makeToast(message: "TEST",
                                        duration: TimeInterval(3.0),
                                        position: .bottom,
                                        title: "",
                                        image: UIImage(named: ""),
                                        backgroundColor: nil,
                                        titleColor: UIColor.cyan,
                                        messageColor: UIColor.yellow,
                                        font: UIFont.systemFont(ofSize: 16))
                    }

                    it("should display a toast") {
                        expect(view?.subviews.count).to(equal(1))
                    }
                }

                context("with message, duration, position, image, background color and font") {
                    beforeEach {
                        view.makeToast(message: "TEST",
                                        duration: TimeInterval(3.0),
                                        position: .center,
                                        title: "",
                                        image: UIImage(named: ""),
                                        backgroundColor: UIColor.blue,
                                        titleColor: nil,
                                        messageColor: nil,
                                        font: UIFont.systemFont(ofSize: 16))
                    }

                    it("should display a toast") {
                        expect(view?.subviews.count).to(equal(1))
                    }
                }

                context("with duration, position, image, background - title - message color and font") {
                    beforeEach {
                        view.makeToast(message: "",
                                        duration: TimeInterval(3.0),
                                        position: .top,
                                        title: "",
                                        image: UIImage(named: "apple_logo.png"),
                                        backgroundColor: UIColor.blue,
                                        titleColor: UIColor.cyan,
                                        messageColor: UIColor.yellow,
                                        font: UIFont.systemFont(ofSize: 16))
                    }

                    it("should display a toast") {
                        expect(view?.subviews.count).to(equal(1))
                    }
                }

                context("with empty message, duration, position, background color and font") {
                    beforeEach {
                        view.makeToast(message: "",
                                        duration: TimeInterval(3.0),
                                        position: .bottom,
                                        title: "",
                                        image: UIImage(named: ""),
                                        backgroundColor: UIColor.blue,
                                        titleColor: nil,
                                        messageColor: nil,
                                        font: UIFont.systemFont(ofSize: 16))
                    }

                    it("should not display a toast") {
                        expect(view?.subviews.count).to(equal(0))
                    }
                }
            })

            context(".makeToast(message:fadeIn:duration:backgroundColor:messageColor:)") {
                beforeEach {
                    view.makeToast(message: "TEST",
                                    duration: TimeInterval(3.0),
                                    backgroundColor: UIColor.blue,
                                    messageColor: UIColor.white)
                }

                it("should display a toast", closure: {
                    expect(view?.subviews.count).to(equal(1))
                })
            }

            context(".makeToast(message:title:backgroundColor:titleColor:messageColor:font:)") {
                beforeEach {
                    view.makeToast(message: "TEST",
                                    title: "TITLE",
                                    backgroundColor: UIColor.blue,
                                    titleColor: UIColor.yellow,
                                    messageColor: UIColor.white,
                                    font: UIFont.systemFont(ofSize: 16))
                }

                it("should display a toast", closure: {
                    expect(view?.subviews.count).to(equal(1))
                })
            }

            context(".makeToast(message:fadeIn:duration:title:backgroundColor:titleColor:messageColor:font:)") {
                beforeEach {
                    view.makeToast(message: "TEST",
                                    duration: TimeInterval(3.0),
                                    title: "TITLE",
                                    backgroundColor: UIColor.blue,
                                    titleColor: UIColor.yellow,
                                    messageColor: UIColor.white,
                                    font: UIFont.systemFont(ofSize: 16))
                }

                it("should display a toast", closure: {
                    expect(view?.subviews.count).to(equal(1))
                })
            }

            context(".makeToast(message:backgroundColor:messageColor:font:)") {
                beforeEach {
                    view.makeToast(message: "MESSAGE",
                                    backgroundColor: UIColor.blue,
                                    messageColor: UIColor.white,
                                    font: UIFont.systemFont(ofSize: 16))
                }

                it("should display a toast", closure: {
                    expect(view?.subviews.count).to(equal(1))
                })
            }

            context(".showToast(toastView:)", { 
                beforeEach {
                    let toastView = UIView()
                    view.showToast(toastView: toastView)
                }

                it("should display a toast") {
                    expect(view.subviews.count).to(equal(1))
                }
            })

            describe(".showToast(toastView:fadeIn:duration:position:)") {
                context("with custom view, duration and center position") {
                    beforeEach {
                        let toastView = UIView()
                        view.showToast(toastView: toastView,
                                       duration: TimeInterval(3.0),
                                       position: .center)
                    }

                    it("should display a toast") {
                        expect(view?.subviews.count).to(equal(1))
                    }
                }

                context("with custom view, duration and top position") {
                    beforeEach {
                        let toastView = UIView()
                        view.showToast(toastView: toastView,
                                       duration: TimeInterval(3.0),
                                       position: .top)
                    }

                    it("should display a toast") {
                        expect(view?.subviews.count).to(equal(1))
                    }
                }

                context("with custom view with duration and point") {
                    beforeEach {
                        let toastView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
                        view.showToast(toastView: toastView,
                                       duration: TimeInterval(3.0),
                                       point: CGPoint(x: 10, y: 10))
                    }

                    it("should display a toast", closure: {
                        expect(view?.subviews.count).to(equal(1))
                    })
                }
            }

            context(".showToast(toastView:point:)") {
                beforeEach {
                    let toastView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
                    view.showToast(toastView: toastView, point: CGPoint(x: 10, y: 10))
                }

                it("should display a toast", closure: {
                    expect(view?.subviews.count).to(equal(1))
                })
            }

            context(".makeToastActivity()") {
                beforeEach {
                    view.makeToastActivity()
                }

                it("should display activity toast") {
                    expect(view?.subviews.count).to(equal(1))
                }
            }
        }
    }

}
