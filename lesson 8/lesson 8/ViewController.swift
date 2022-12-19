//
//  ViewController.swift
//  lesson 8
//
//  Created by Lashaun Corinna on 12/16/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        let userDefaults = UserDefaults.standard   //del
//         userDefaults.set(false, forKey: "presentationWasViewed")  //del

        startPresentation()
    }
    
    func startPresentation() {
        let userDefaults = UserDefaults.standard
        let presentationWasViewed = userDefaults.bool(forKey: "presentationWasViewed")
        if presentationWasViewed == false {
            if let pageViewController = storyboard?.instantiateViewController(withIdentifier: "PageViewController") as? PageViewController {
                
                present(pageViewController, animated: true, completion: nil)
            }
        }
    }
    
}

