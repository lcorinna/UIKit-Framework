//
//  ViewController.swift
//  lesson 9
//
//  Created by Lashaun Corinna on 12/19/22.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.textColor = .white
        
        swipesObservers()
        tapObserver()
    }

    func swipesObservers() {
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    func tapObserver() {

        let tripleTap = UITapGestureRecognizer(target: self, action: #selector(tripleTapAction))
        tripleTap.numberOfTapsRequired = 3
        self.view.addGestureRecognizer(tripleTap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapAction))
        doubleTap.require(toFail: tripleTap)
        doubleTap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doubleTap)
    }

    @objc func handleSwipes(gester: UISwipeGestureRecognizer) {
        
        switch gester.direction {
        case .left :
            label.text = "Right swipe"
        case .right :
            label.text = "Left swipe"
        case .up :
            label.text = "Up swipe"
        case .down :
            label.text = "Down swipe"
        default :
            label.text = "Swipe not recognized"
        }
    }
    
    @objc func tripleTapAction(tap: UITapGestureRecognizer) {
        label.text = "Triple tab"
    }
    
    @objc func doubleTapAction(tap: UITapGestureRecognizer) {
        label.text = "Double tab"
    }
}

