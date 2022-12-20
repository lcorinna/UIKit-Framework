//
//  ContentViewController.swift
//  lesson 8
//
//  Created by Lashaun Corinna on 12/16/22.
//

import UIKit

class ContentViewController: UIViewController {
    
    @IBOutlet weak var presentTextLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var pageConrtoll: UIPageControl!
    @IBOutlet weak var endButton: UIButton!
    
    var presentText = ""
    var emoji = ""
    var currentPage = 0
    var numberOfPage = 0
    var hiddenButton = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentTextLabel.text = presentText
        emojiLabel.text = emoji
        pageConrtoll.numberOfPages = (numberOfPage - 1)
        pageConrtoll.currentPage = currentPage
        
        endButton.isHidden = true
        
        if hiddenButton == true {
            endButton.isHidden = false
            endButton.tintColor = .white
            endButton.setTitle("Got it", for: .normal)
        }
        
    }
    
    @IBAction func endButtonAction(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: "presentationWasViewed")
        dismiss(animated: true, completion: nil)
    }
}
