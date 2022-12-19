//
//  ViewController.swift
//  lesson 4
//
//  Created by Lashaun Corinna on 12/13/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var trackTitle = ""
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(i)
        i += 1
        
        titleLabel.text = trackTitle
        titleLabel.numberOfLines = 0
        
        image.image = UIImage(named: trackTitle)
    }

}

